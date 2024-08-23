import { ConflictException, Injectable, NotFoundException, UnauthorizedException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Contact, User } from './schemas/user.schema';
import { Model } from 'mongoose';
import * as bcrypt from 'bcrypt';
import { SignInUserDto, AuthResponseDto } from './dto/sign-in-user.dto';
import { JwtService } from '@nestjs/jwt';
import { UserDto, UserProfileDto } from './dto/user.dto';
import { CreateContactDto } from './dto/contact-dtos';

@Injectable()
export class UsersService {
  private saltOrRounds: number = 10;

  constructor(
    @InjectModel(User.name) private userModel: Model<User>,
                            private jwtService: JwtService
  ) { }

  async signUp(createUserDto: CreateUserDto): Promise<AuthResponseDto> {
    const hashPass = await bcrypt.hash(createUserDto.password, this.saltOrRounds);
    createUserDto.password = hashPass;
    const user = new this.userModel(createUserDto);
    const entity = await user.save();

    const payload = { sub: (entity as any)._id, email: entity.email };

    return {
      token: await this.jwtService.signAsync(payload),
      user: this.convertEntityToProfileDto(entity)
    };
  }

  async signIn(signInUserDto: SignInUserDto): Promise<AuthResponseDto> {
    const entities = await this.userModel.find({ email: signInUserDto.email }).exec();
    const entity = entities[0];
    const isMatch = await bcrypt.compare(signInUserDto.password, entity.password);
    if (!isMatch) {
      throw new UnauthorizedException();
    }
    
    // jwt + return entity
    const payload = { sub: (entity as any)._id, email: entity.email };

    return {
      token: await this.jwtService.signAsync(payload),
      user: this.convertEntityToProfileDto(entity)
    };
  }


  async findAll(): Promise<UserDto[]> {
    const entities = await this.userModel.find().exec();
    return entities.map(entity => this.convertEntityToUserDto(entity));
  }

  async findOne(id: string): Promise<UserDto> {
    const entity = await this.userModel.findById(id).exec();
    return this.convertEntityToUserDto(entity);
  }

  async findOneFull(id: string): Promise<UserProfileDto> {
    const entity = await this.userModel.findById(id).exec();
    console.log(entity);
    
    return this.convertEntityToProfileDto(entity);
  }

  async findByFullName(fullName: string, id: number): Promise<UserDto[]> {
    const regex = new RegExp(fullName, 'i');
    const entities = await this.userModel.find({ fullName: { $regex: regex }, _id: { $ne: id } }).exec();
    return entities.map(entity => this.convertEntityToUserDto(entity));
  }

  async findByEmail(email: string, id: number): Promise<UserDto[]> {
    const regex = new RegExp(email, 'i');
    const entities = await this.userModel.find({ email: { $regex: regex }, _id: { $ne: id } }).exec();
    return entities.map(entity => this.convertEntityToUserDto(entity));
  }

  async update(id: number, updateUserDto: UpdateUserDto): Promise<UserProfileDto> {
    const entity = await this.userModel.findByIdAndUpdate(id, updateUserDto, { new: true }).exec();
    return this.convertEntityToProfileDto(entity);
  }

  async addContact(createContactDto: CreateContactDto, userId: String): Promise<User> {
    const userEntity = await this.userModel.findById(userId).exec();
    if (!userEntity) {
      throw new NotFoundException('User not found');
    }

    const contactExists = userEntity.contacts.some(contact => contact.email === createContactDto.email);
    if (contactExists) {
      throw new ConflictException('Contact already exists');
    }

    const contactEntities = await this.userModel.find({ email: createContactDto.email, fullName: createContactDto.fullName }).exec();
    const contactEntity = contactEntities[0];

    // create a contact for the contact
    const contact: Contact = {
      nickname: contactEntity.fullName,
      fullName: contactEntity.fullName,
      email: contactEntity.email
    }

    // create a contact for the user too
    const user: Contact = {
      nickname: userEntity.fullName,
      fullName: userEntity.fullName,
      email: userEntity.email
    }

    // add the contact to the user's contacts
    userEntity.contacts.push(contact);
    // add the user to the contact's contacts
    contactEntity.contacts.push(user);
    // save them both
    contactEntity.save();
    return userEntity.save();
  }

  remove(id: number) {
    return this.userModel.findByIdAndDelete(id).exec();
  }

  convertEntityToProfileDto(user: User): UserProfileDto {
    return {
      fullName: user.fullName,
      email: user.email,
      birthday: user.birthday,
      phoneNumber: user.phoneNumber,
      country: user.country,
      city: user.city,
      location: user.location,
      gender: user.gender,
      contacts: user.contacts,
      profileUrl: user.profileUrl,
      unreadMessageSum: user.unreadMessageSum,
      unreadMessages: user.unreadMessages,
      preferences: user.preferences,
      securitySettings: user.securitySettings,
    }
  }

  convertEntityToUserDto(user: User): UserDto {
    return {
      fullName: user.fullName,
      email: user.email,
      birthday: user.securitySettings.showBirthDay ? user.birthday : null,
      phoneNumber: user.securitySettings.showPhoneNumber ? user.phoneNumber : null,
      country: user.securitySettings.showHomePlace ? user.country : null,
      city: user.securitySettings.showHomePlace ? user.city : null,
      location: user.securitySettings.showLocation ? user.location : null,
      gender: user.securitySettings.showGender ? user.gender : null,
      profileUrl: user.profileUrl,
    }
  }
}

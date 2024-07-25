import { Injectable, UnauthorizedException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { InjectModel } from '@nestjs/mongoose';
import { User } from './schemas/user.schema';
import { Model } from 'mongoose';
import * as bcrypt from 'bcrypt';
import { SignInUserDto, AuthResponseDto } from './dto/sign-in-user.dto';
import { JwtService } from '@nestjs/jwt';
import { UserDto, UserProfileDto } from './dto/user.dto';

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

  async findByFullName(fullName: string): Promise<UserDto[]> {
    const entities = await this.userModel.find({ fullName }).exec();
    return entities.map(entity => this.convertEntityToUserDto(entity));
  }

  async findByEmail(email: string): Promise<UserDto[]> {
    const entities = await this.userModel.find({ email }).exec();
    return entities.map(entity => this.convertEntityToUserDto(entity));
  }

  async update(id: number, updateUserDto: UpdateUserDto): Promise<UserProfileDto> {
    const entity = await this.userModel.findByIdAndUpdate(id, updateUserDto, { new: true }).exec();
    return this.convertEntityToProfileDto(entity);
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

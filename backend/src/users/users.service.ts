import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { InjectModel } from '@nestjs/mongoose';
import { User } from './schemas/user.schema';
import { Model } from 'mongoose';

@Injectable()
export class UsersService {

  constructor(@InjectModel(User.name) private userModel: Model<User>) { }

  create(createUserDto: CreateUserDto): Promise<User> {
    const user = new this.userModel(createUserDto);
    return user.save();
  }

  findAll(): Promise<User[]> {
    return this.userModel.find().exec();
  }

  findOne(id: number): Promise<User> {
    return this.userModel.findById(id).exec();
  }

  findByFullName(fullName: string): Promise<User[]> {
    return this.userModel.find({ fullName }).exec();
  }

  findByEmail(email: string): Promise<User[]> {
    return this.userModel.find({ email }).exec();
  }

  update(id: number, updateUserDto: UpdateUserDto): Promise<User> {
    return this.userModel.findByIdAndUpdate(id, updateUserDto, { new: true }).exec();
  }

  remove(id: number) {
    return this.userModel.findByIdAndDelete(id).exec();
  }
}

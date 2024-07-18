import { Controller, Get, Post, Body, Patch, Param, Delete, Query, UseGuards } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { SignInUserDto, SignInUserResponseDto } from './dto/sign-in-user.dto';
import { UserDto, UserProfileDto } from './dto/user.dto';
import { AuthGuard } from 'src/shared/guards/auth.guard';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post('/signUp')
  create(@Body() createUserDto: CreateUserDto): Promise<boolean> {
    return this.usersService.signUp(createUserDto);
  }

  @Post('/signIn')
  signIn(@Body() signInUserDto: SignInUserDto): Promise<SignInUserResponseDto> {
    return this.usersService.signIn(signInUserDto);
  }

  @Get()
  @UseGuards(AuthGuard)
  findAll(): Promise<UserDto[]> {
    return this.usersService.findAll();
  }

  @Get('/search')
  findBySearch(
    @Query('email') email: string,
    @Query('fullName') fullName: string,
  ): Promise<UserDto[]> {
    if (email) {
      return this.usersService.findByEmail(email);
    } else if (fullName) {
      return this.usersService.findByFullName(fullName);
    } else {
      throw new Error('Specify either "email" or "fullName" query parameter.');
    }
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<UserDto> {
    return this.usersService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateUserDto: UpdateUserDto): Promise<UserProfileDto> {
    return this.usersService.update(+id, updateUserDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.usersService.remove(+id);
  }
}

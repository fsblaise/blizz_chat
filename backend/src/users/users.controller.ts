import { Controller, Get, Post, Body, Patch, Param, Delete, Query, UseGuards, Req } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { SignInUserDto, AuthResponseDto } from './dto/sign-in-user.dto';
import { UserDto, UserProfileDto } from './dto/user.dto';
import { AuthGuard } from 'src/shared/guards/auth.guard';
import { CreateContactDto } from './dto/contact-dtos';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post('/signUp')
  create(@Body() createUserDto: CreateUserDto): Promise<AuthResponseDto> {
    return this.usersService.signUp(createUserDto);
  }

  @Post('/signIn')
  signIn(@Body() signInUserDto: SignInUserDto): Promise<AuthResponseDto> {
    return this.usersService.signIn(signInUserDto);
  }

  @Get()
  @UseGuards(AuthGuard)
  fetchUserByToken(@Req() request: Request): Promise<UserProfileDto> {
    const user = request['user'];
    console.log(user);
    console.log(user.sub);
    return this.usersService.findOneFull(user.sub);
  }

  @Get('/all')
  @UseGuards(AuthGuard)
  findAll(): Promise<UserDto[]> {
    return this.usersService.findAll();
  }

  @Get('/search')
  @UseGuards(AuthGuard)
  findBySearch(
    @Req() request: Request,
    @Query('email') email?: string | null,
    @Query('fullName') fullName?: string | null,
  ): Promise<UserDto[]> {
    const user = request['user'];
    if (email) {
      return this.usersService.findByEmail(email, user.sub);
    } else if (fullName) {
      return this.usersService.findByFullName(fullName, user.sub);
    } else {
      throw new Error('Specify either "email" or "fullName" query parameter.');
    }
  }

  @Post('/add')
  @UseGuards(AuthGuard)
  addContact(@Body() createContactDto: CreateContactDto, @Req() request: Request) {
    const user = request['user'];
    return this.usersService.addContact(createContactDto, user.sub);
  }

  @Get(':id')
  @UseGuards(AuthGuard)
  findOne(@Param('id') id: string): Promise<UserDto> {
    return this.usersService.findOne(id);
  }

  @Patch(':id')
  @UseGuards(AuthGuard)
  update(@Param('id') id: string, @Body() updateUserDto: UpdateUserDto): Promise<UserProfileDto> {
    return this.usersService.update(+id, updateUserDto);
  }

  @Delete(':id')
  @UseGuards(AuthGuard)
  remove(@Param('id') id: string) {
    return this.usersService.remove(+id);
  }
}

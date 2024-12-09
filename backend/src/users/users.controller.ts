import { Controller, Get, Post, Body, Patch, Param, Delete, Query, UseGuards, Req, UseInterceptors, UploadedFile, Res } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { SignInUserDto, AuthResponseDto } from './dto/sign-in-user.dto';
import { UserDto, UserProfileDto } from './dto/user.dto';
import { AuthGuard } from 'src/shared/guards/auth.guard';
import { CreateContactDto, UpdateContactDto } from './dto/contact-dtos';
import { diskStorage } from 'multer';
import { join } from 'path';
import * as fs from 'fs';
import { FileInterceptor } from '@nestjs/platform-express';
import { Request, Response } from 'express';

const storage = diskStorage({
  destination: (req, file, cb) => {
    const dir = join(__dirname, '..', 'uploads/users');

    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir, { recursive: true });
    }

    cb(null, dir);
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1e9);
    cb(null, `${file.fieldname}-${uniqueSuffix}-${file.originalname}`);
  },
});

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get('/hello')
  hello(): string {
    return 'Hello!';
  }

  @Post('/signUp')
  async create(@Res({ passthrough: true }) res: Response, @Body() createUserDto: CreateUserDto): Promise<AuthResponseDto> {
    const dto = await this.usersService.signUp(createUserDto);
    res.cookie('authToken', dto.token, {
      httpOnly: true,
      secure: true,
      sameSite: 'strict',
    });
    return dto;
  }

  @Post('/signIn')
  async signIn(@Res({ passthrough: true }) res: Response, @Body() signInUserDto: SignInUserDto): Promise<AuthResponseDto> {
    console.log(signInUserDto);
    
    const dto = await this.usersService.signIn(signInUserDto);
    res.cookie('authToken', dto.token, {
      httpOnly: true,
      secure: true,
      sameSite: 'strict',
    });
    console.log("success?");
    
    return dto;
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
  findAll(@Req() request: Request): Promise<UserDto[]> {
    const user = request['user'];
    return this.usersService.findAllContacts(user.sub);
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
  addContact(@Body() createContactDto: CreateContactDto, @Req() request: Request): Promise<UserProfileDto> {
    const user = request['user'];
    return this.usersService.addContact(createContactDto, user.sub);
  }

  @Get(':id')
  @UseGuards(AuthGuard)
  findOne(@Param('id') id: string): Promise<UserDto> {
    return this.usersService.findOne(id);
  }

  @Patch()
  @UseGuards(AuthGuard)
  updateUser(@Req() request: Request, @Body() updateUserDto: UpdateUserDto): Promise<UserProfileDto> {
    const user = request['user'];
    return this.usersService.updateUser(user.sub, updateUserDto);
  }

  @Patch('/contact')
  @UseGuards(AuthGuard)
  updateContact(@Req() request: Request, @Body() updateContactDto: UpdateContactDto): Promise<UserProfileDto> {
    const user = request['user'];
    return this.usersService.updateContact(user.sub, updateContactDto);
  }

  @Patch('/image')
  @UseGuards(AuthGuard)
  @UseInterceptors(FileInterceptor('file', { storage }))
  updateImage(@Req() request: Request, @UploadedFile() file: Express.Multer.File,): Promise<UserProfileDto> {
    const user = request['user'];
    return this.usersService.updateImage(user.sub, file, request);
  }

  @Delete()
  @UseGuards(AuthGuard)
  remove(@Param('email') email: string) {
    return this.usersService.remove(email);
  }

  @Delete('/contact/:email')
  @UseGuards(AuthGuard)
  removeContact(@Param('email') email: string, @Req() request: Request): Promise<UserProfileDto> {
    const user = request['user'];
    return this.usersService.removeContact(email, user.sub);
  }
}

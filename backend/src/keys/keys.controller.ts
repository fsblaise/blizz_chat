import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, Req } from '@nestjs/common';
import { KeysService } from './keys.service';
import { CreateKeyDto, KeyDto } from './dto/key.dto';
import { AuthGuard } from 'src/shared/guards/auth.guard';

@Controller('keys')
export class KeysController {
  constructor(private readonly keysService: KeysService) {}

  @Post('/share')
  @UseGuards(AuthGuard)
  sharePublicKeys(@Body() publicKeys: CreateKeyDto, @Req() request: Request) : Promise<KeyDto> {
    const user = request['user'];
    console.log('asd');    
    
    return this.keysService.create(publicKeys, user.email);
  }

  @Post('/fetch')
  @UseGuards(AuthGuard)
  fetchPublicKeys(@Body() emails: string[]) : Promise<KeyDto[]> {
    return this.keysService.findAll(emails);
  }

  // @Patch(':id')
  // update(@Param('id') id: string, @Body() updateKeyDto: KeyDto) {
  //   return this.keysService.update(+id, updateKeyDto);
  // }

  // @Delete(':id')
  // remove(@Param('id') id: string) {
  //   return this.keysService.remove(+id);
  // }
}

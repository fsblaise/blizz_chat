import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, Req } from '@nestjs/common';
import { CompaniesService } from './companies.service';
import { CompanyDto, MemberDto } from './dto/company.dto';
import { AuthGuard } from 'src/shared/guards/auth.guard';

@Controller('companies')
export class CompaniesController {
  constructor(private readonly companiesService: CompaniesService) {}

  @Post()
  @UseGuards(AuthGuard)
  create(@Body() createCompanyDto: CompanyDto, @Req() request: Request): Promise<CompanyDto> {
    const user = request['user'];
    return this.companiesService.create(createCompanyDto, user.email);
  }

  @Get()
  @UseGuards(AuthGuard)
  findAll(): Promise<CompanyDto[]> {
    return this.companiesService.findAll();
  }

  @Get(':id')
  @UseGuards(AuthGuard)
  findOne(@Param('id') id: string): Promise<CompanyDto> {
    return this.companiesService.findOne(id);
  }

  @Patch(':id')
  @UseGuards(AuthGuard)
  update(@Param('id') id: string, @Body() updateCompanyDto: CompanyDto): Promise<CompanyDto> {
    return this.companiesService.updateCompany(id, updateCompanyDto);
  }

  @Delete(':id')
  @UseGuards(AuthGuard)
  remove(@Param('id') id: string) {
    return this.companiesService.removeCompany(id);
  }

  // Members

  @Post(':id/members')
  @UseGuards(AuthGuard)
  addMember(@Param('id') id: string, @Body() member: MemberDto): Promise<CompanyDto> {
    return this.companiesService.addMember(id, member);
  }

  // init, because this is the first endpoint that will be called
  @Get('init/:email')
  checkIfEmailInCompany(@Param('email') email: string): Promise<CompanyDto[]> {
    console.log('Checking if email is in company: ', email);
    
    return this.companiesService.checkIfEmailInCompany(email);
  }

  @Patch(':id/members/:email')
  @UseGuards(AuthGuard)
  updateMember(@Param('id') id: string, @Param('email') email: string, @Body() member: MemberDto): Promise<CompanyDto> {
    return this.companiesService.updateMember(id, email, member);
  }

  @Delete(':id/members/:email')
  @UseGuards(AuthGuard)
  removeMember(@Param('id') id: string, @Param('email') email: string): Promise<CompanyDto> {
    return this.companiesService.removeMember(id, email);
  }
}

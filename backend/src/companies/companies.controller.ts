import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { CompaniesService } from './companies.service';
import { CompanyDto, MemberDto } from './dto/company.dto';

@Controller('companies')
export class CompaniesController {
  constructor(private readonly companiesService: CompaniesService) {}

  @Post()
  create(@Body() createCompanyDto: CompanyDto): Promise<CompanyDto> {
    return this.companiesService.create(createCompanyDto);
  }

  @Get()
  findAll(): Promise<CompanyDto[]> {
    return this.companiesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<CompanyDto> {
    return this.companiesService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateCompanyDto: CompanyDto): Promise<CompanyDto> {
    return this.companiesService.updateCompany(id, updateCompanyDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.companiesService.removeCompany(id);
  }

  // Members

  @Post(':id/members')
  addMember(@Param('id') id: string, @Body() member: MemberDto): Promise<CompanyDto> {
    return this.companiesService.addMember(id, member);
  }

  // init, because this is the first endpoint that will be called
  @Get('init/:email')
  checkIfEmailInCompany(@Param('email') email: string): Promise<CompanyDto> {
    return this.companiesService.checkIfEmailInCompany(email);
  }

  @Patch(':id/members/:email')
  updateMember(@Param('id') id: string, @Param('email') email: string, @Body() member: MemberDto): Promise<CompanyDto> {
    return this.companiesService.updateMember(id, email, member);
  }

  @Delete(':id/members/:email')
  removeMember(@Param('id') id: string, @Param('email') email: string): Promise<CompanyDto> {
    return this.companiesService.removeMember(id, email);
  }
}

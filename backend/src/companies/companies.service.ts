import { Injectable } from '@nestjs/common';
import { CompanyDto, MemberDto } from './dto/company.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Company } from './schemas/company.schema';
import { Model } from 'mongoose';

@Injectable()
export class CompaniesService {

  constructor(@InjectModel(Company.name) private companyModel: Model<Company>) { }

  create(createCompanyDto: CompanyDto): Promise<CompanyDto> {
    const createdCompany = new this.companyModel(createCompanyDto);
    return createdCompany.save();
  }

  findAll(): Promise<CompanyDto[]> {
    return this.companyModel.find().exec();
  }

  findOne(id: string): Promise<CompanyDto> {
    return this.companyModel.findById(id).exec();
  }

  updateCompany(id: string, updateCompanyDto: CompanyDto): Promise<CompanyDto> {
    return this.companyModel.findByIdAndUpdate(id, updateCompanyDto).exec();
  }

  removeCompany(id: string) {
    return this.companyModel.findByIdAndDelete(id).exec();
  }

  // Members

  addMember(id: string, member: MemberDto): Promise<CompanyDto> {
    return this.companyModel.findByIdAndUpdate(id, { $push: { members: member } }).exec();
  }

  checkIfEmailInCompany(email: string): Promise<CompanyDto[]> {
    return this.companyModel.find({ 'members.email': email }).exec();
  }

  updateMember(id: string, email: string, member: MemberDto): Promise<CompanyDto> {
    return this.companyModel.findOneAndUpdate({ _id: id, 'members.email': email }, { $set: { 'members.$': member } }).exec();
  }

  removeMember(id: string, email: string): Promise<CompanyDto> {
    return this.companyModel.findByIdAndUpdate(id, { $pull: { 'members.email': email } }).exec();
  }
}

import { Injectable } from '@nestjs/common';
import { CompanyDto, MemberDto } from './dto/company.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Company } from './schemas/company.schema';
import { Model } from 'mongoose';
import { User } from 'src/users/schemas/user.schema';

@Injectable()
export class CompaniesService {

  constructor(
    @InjectModel(Company.name) private companyModel: Model<Company>,
    @InjectModel(User.name) private userModel: Model<User>,
  ) { }

  async create(createCompanyDto: CompanyDto, email: string): Promise<CompanyDto> {
    const user = await this.userModel.findOne({ email }).exec();
    createCompanyDto.members = [{ email, fullName: user.fullName, role: 'admin' }];
    const createdCompany = new this.companyModel(createCompanyDto);
    await createdCompany.save();
    return this.renderCompany(createdCompany);
  }

  async findAll(): Promise<CompanyDto[]> {
    const entities = await this.companyModel.find().exec();
    return entities.map(entity => this.renderCompany(entity));
  }

  async findOne(id: string): Promise<CompanyDto> {
    const entity = await this.companyModel.findById(id).exec();
    return this.renderCompany(entity);
  }

  async updateCompany(id: string, updateCompanyDto: CompanyDto): Promise<CompanyDto> {
    const entity = await this.companyModel.findByIdAndUpdate(id, updateCompanyDto).exec();
    return this.renderCompany(entity);
  }

  removeCompany(id: string) {
    return this.companyModel.findByIdAndDelete(id).exec();
  }

  // Members

  async addMember(id: string, member: MemberDto): Promise<CompanyDto> {
    const entity = await this.companyModel.findByIdAndUpdate(id, { $push: { members: member } }).exec();
    return this.renderCompany(entity);
  }

  async checkIfEmailInCompany(email: string): Promise<CompanyDto[]> {
    const entities = await this.companyModel.find({ 'members.email': email }).exec();
    return entities.map(entity => this.renderCompany(entity));
  }

  async updateMember(id: string, email: string, member: MemberDto): Promise<CompanyDto> {
    const entity = await this.companyModel.findOneAndUpdate({ _id: id, 'members.email': email }, { $set: { 'members.$': member } }).exec();
    return this.renderCompany(entity);
  }

  async removeMember(id: string, email: string): Promise<CompanyDto> {
    const entity = await this.companyModel.findByIdAndUpdate(id, { $pull: { 'members.email': email } }).exec();
    return this.renderCompany(entity);
  }

  renderCompany(company: Company): CompanyDto {
    return {
      id: company._id.toString(),
      name: company.name,
      apiUrl: company.apiUrl,
      members: company.members.map(member => {
        return {
          fullName: member.fullName,
          email: member.email,
          role: member.role
        };
      })
    };
  }
}

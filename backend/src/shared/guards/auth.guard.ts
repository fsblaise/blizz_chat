import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthGuard implements CanActivate {
  constructor(private jwtService: JwtService) { }

  async canActivate(context: ExecutionContext): Promise<boolean> {
    try {
      const request = context.switchToHttp().getRequest();
      console.log(request.url);

      console.log(request.headers.authorization);

      let token = AuthGuard.extractTokenFromHeader(request.headers.authorization);

      console.log(`Token: ${token}`);
      

      if (!token) {
        console.log('no token in header');
        
        console.log(request.cookies);
        
        token = request.cookies['authToken'];
      }

      const secret = process.env['JWT_SECRET'];

      console.log(secret);

      if (!token) {
        throw new UnauthorizedException();
      }

      const payload = await this.jwtService.verifyAsync(
        token,
        {
          secret
        }
      );

      request['user'] = payload;
    } catch (e) {
      console.log(e);
      
      throw new UnauthorizedException();
    }
    return true;
  }

  static extractTokenFromHeader(authorization: String): string | undefined {
    try {
      const [type, token] = authorization.split(' ') ?? [];
      return type === 'Bearer' ? token : undefined;
    } catch {
      return undefined;
    }
  }
}
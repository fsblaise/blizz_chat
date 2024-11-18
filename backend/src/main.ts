import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as cookieParser from 'cookie-parser';


async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  // app.enableCors({
  //   origin: '*',  // Ensure this aligns with your WebSocket CORS setup
  // });
  app.enableCors({
    origin: 'http://localhost:4200', // Specify the allowed origin
    credentials: true,              // Allow credentials (cookies, etc.)
  });
  app.use(cookieParser());
  await app.listen(3000);
}
bootstrap();

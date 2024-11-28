import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as cookieParser from 'cookie-parser';


async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors({
    origin: [
      'https://blizz-chat.vercel.app',
      '*',
    ],
    credentials: true,
  });
  app.use(cookieParser());
  const port = process.env.PORT || 3000;
  await app.listen(port);
}
bootstrap();

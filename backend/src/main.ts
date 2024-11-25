import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as cookieParser from 'cookie-parser';


async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  // app.enableCors({
  //   origin: '*',  // Ensure this aligns with your WebSocket CORS setup
  // });
  app.enableCors({
    origin: [
      'https://blizz-chat-a0erk5fzm-balazs-olahs-projects.vercel.app', // Web frontend
      '*', // Allow mobile clients
    ],
    credentials: true, // Allow credentials
  });
  app.use(cookieParser());
  const port = process.env.PORT || 3000;
  await app.listen(port);
}
bootstrap();

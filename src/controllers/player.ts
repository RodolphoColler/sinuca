import { Response, Request, NextFunction } from 'express';
import prisma from "../prisma/prisma"


export async function create(req: Request, res: Response, next: NextFunction): Promise<any>  {
  try {
    const { name } = req.body;

    const player = await prisma.player.create({ data: { name } });

    return res.status(201).json({ player });
  } catch (error) {
    return next(error);
  }
}

export async function read(req: Request, res: Response, next: NextFunction): Promise<any>  {
  try {
    const players = await prisma.player.findMany();

    return res.status(200).json({ players });
  } catch (error) {
    return next(error);
  }
}

export async function update(req: Request, res: Response, next: NextFunction): Promise<any>  {
  try {
    const { name } = req.body;
    const { id } = req.params;

    const player = await prisma.player.update({
      where: { id: Number(id) },
      data: { name },
    });

    return res.status(200).json({ player });
  } catch (error) {
    return next(error);
  }
}

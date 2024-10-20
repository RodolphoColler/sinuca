import { Router } from 'express';
import prisma from '../prisma/prisma'
import { Response, Request, NextFunction } from 'express';
import { create as createSingle } from '../controllers/singleMatch';


const router = Router();

async function create(req: Request, res: Response, next: NextFunction): Promise<any>  {
  await prisma.player.createMany({ data: [
    {name:"Allan"},
    {name:"Rodolpho"},
    {name:"Pedro"},
    {name:"Baianinho"},
    {name:"Netto"},
    {name:"Dani"},
  ] });


  const duoPlayers = [
    {
      player_one_id:3,
      player_two_id:4,
    },
    {
        player_one_id:5,
        player_two_id:4,
    },
    {
        player_one_id:1,
        player_two_id:2,
    },
    {
        player_one_id:1,
        player_two_id:3,
    },
  ]

  const createdPlayers = duoPlayers.map(async ({ player_one_id, player_two_id}) => {
    const duoPlayer = await prisma.duoPlayer.create({
      data: {
        player_one: { connect: { id: player_one_id } },
        player_two: { connect: { id: player_two_id } },
      }
    })
  });

  await Promise.all(createdPlayers);

  const singleMatch =  [
    {
      player_one_id:3,
      player_two_id:4,
      player_one: { connect: { id: 3 } },
      player_two: { connect: { id: 4 } },
      result:3,
    },
    {
      player_one_id:5,
      player_two_id:3,
      player_one: { connect: { id: 5 } },
      player_two: { connect: { id: 3 } },
      result:5,
    },
    {
      player_one_id:6,
      player_two_id:3,
      player_one: { connect: { id: 6 } },
      player_two: { connect: { id: 3 } },
      result:6,
    },
    {
      player_one_id:5,
      player_two_id:1,
      player_one: { connect: { id: 5 } },
      player_two: { connect: { id: 1 } },
      result:1,
    }
  ]

  const createdSingleMatches = singleMatch.map(async ({ result,player_one_id, player_two_id }) => {
    const singleMatch = await prisma.singleMatch.create({ 
      data: {
        result,
        player_one: { connect: { id: player_one_id } },
        player_two: { connect: { id: player_two_id } },
      } 
    });
  });

  await Promise.all(createdSingleMatches);

  const duoMatch = [
    {
      duo_one_id:1,
      duo_two_id:2,
      result:1,
  },
  {
      duo_one_id:3,
      duo_two_id:2,
      result:2,
  },
  {
      duo_one_id:4,
      duo_two_id:1,
      result:4,
  },
  ]

  duoMatch.forEach(async ({duo_one_id, duo_two_id, result} ) => {
    const singleMatch = await prisma.duoMatch.create({ 
      data: {
        result,
        duo_player: { connect: { id: duo_one_id } },
        duo_player_two: { connect: { id: duo_two_id } },
      } 
    });
  });




  return res.status(201).json({});
}

router.post('/', create);

export default router;
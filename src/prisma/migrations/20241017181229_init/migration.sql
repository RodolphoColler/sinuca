-- DropIndex
DROP INDEX `DuoMatches_duo_one_id_fkey` ON `duomatches`;

-- DropIndex
DROP INDEX `DuoMatches_duo_two_id_fkey` ON `duomatches`;

-- DropIndex
DROP INDEX `DuoPlayer_player_one_id_fkey` ON `duoplayer`;

-- DropIndex
DROP INDEX `DuoPlayer_player_two_id_fkey` ON `duoplayer`;

-- DropIndex
DROP INDEX `SingleMatches_player_one_id_fkey` ON `singlematches`;

-- DropIndex
DROP INDEX `SingleMatches_player_two_id_fkey` ON `singlematches`;

-- AddForeignKey
ALTER TABLE `SingleMatches` ADD CONSTRAINT `SingleMatches_player_one_id_fkey` FOREIGN KEY (`player_one_id`) REFERENCES `Player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SingleMatches` ADD CONSTRAINT `SingleMatches_player_two_id_fkey` FOREIGN KEY (`player_two_id`) REFERENCES `Player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DuoPlayer` ADD CONSTRAINT `DuoPlayer_player_one_id_fkey` FOREIGN KEY (`player_one_id`) REFERENCES `Player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DuoPlayer` ADD CONSTRAINT `DuoPlayer_player_two_id_fkey` FOREIGN KEY (`player_two_id`) REFERENCES `Player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DuoMatches` ADD CONSTRAINT `DuoMatches_duo_one_id_fkey` FOREIGN KEY (`duo_one_id`) REFERENCES `DuoPlayer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DuoMatches` ADD CONSTRAINT `DuoMatches_duo_two_id_fkey` FOREIGN KEY (`duo_two_id`) REFERENCES `DuoPlayer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

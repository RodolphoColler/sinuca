-- CreateTable
CREATE TABLE `Player` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Player_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SingleMatches` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `player_one_id` INTEGER NOT NULL,
    `player_two_id` INTEGER NOT NULL,
    `result` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DuoPlayer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `player_one_id` INTEGER NOT NULL,
    `player_two_id` INTEGER NOT NULL,
    `result` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DuoMatches` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `duo_one_id` INTEGER NOT NULL,
    `duo_two_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

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

CREATE TABLE `house`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `location` GEOMETRY NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `block` VARCHAR(255) NOT NULL
);
CREATE TABLE `user_log`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `entry` DATETIME NOT NULL,
    `exit` DATETIME NOT NULL,
    `total` INT NOT NULL
);
CREATE TABLE `vehicle`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(255) NOT NULL,
    `plate` VARCHAR(255) NOT NULL,
    `color` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL
);
CREATE TABLE `trash`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `location` GEOMETRY NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `qty` INT NOT NULL,
    `user_id` INT NOT NULL
);
CREATE TABLE `early_warning`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `water_level` DOUBLE(8, 2) NOT NULL,
    `date` DATE NOT NULL,
    `time` TIME NOT NULL,
    `house_id` INT NOT NULL
);
CREATE TABLE `concern_report`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `concern` VARCHAR(255) NOT NULL,
    `pict` VARCHAR(255) NOT NULL,
    `desc` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL
);
CREATE TABLE `user_group`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_cat` VARCHAR(255) NOT NULL
);
CREATE TABLE `user`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `no_telp` INT NOT NULL,
    `group_id` INT NOT NULL,
    `house_id` INT NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `trash` ADD CONSTRAINT `trash_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `vehicle` ADD CONSTRAINT `vehicle_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `user` ADD CONSTRAINT `user_house_id_foreign` FOREIGN KEY(`house_id`) REFERENCES `house`(`id`);
ALTER TABLE
    `user_log` ADD CONSTRAINT `user_log_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `user` ADD CONSTRAINT `user_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `user_group`(`id`);
ALTER TABLE
    `concern_report` ADD CONSTRAINT `concern_report_id_foreign` FOREIGN KEY(`id`) REFERENCES `user`(`id`);
ALTER TABLE
    `concern_report` ADD CONSTRAINT `concern_report_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `early_warning` ADD CONSTRAINT `early_warning_id_foreign` FOREIGN KEY(`id`) REFERENCES `house`(`id`);
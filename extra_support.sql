CREATE TABLE IF NOT EXISTS parkings (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(255) NOT NULL,
    street VARC HAR(255) NOT NULL,
    number VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS vehicles (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    parkings_id INT UNSIGNED NULL,
    plate_number VARCHAR(255) NOT NULL UNIQUE,
    brand VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,

    FOREIGN KEY (parkings_id) REFERENCES parkings (id) 
    ON DELETE SET NULL
    ON UPDATE  CASCADE
);

CREATE TABLE IF NOT EXISTS vehicles_images (
    vehicles_id INT UNSIGNED NOT NULL,
    url VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS driver_vehicle ( 
    driver_id INT UNSIGNED NOT NULL PRIMARY KEY,
    vehicles_id INT UNSIGNED NOT NULL UNIQUE,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,

    FOREIGN KEY (driver_id) REFERENCES drivers(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
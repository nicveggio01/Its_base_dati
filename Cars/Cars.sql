
CREATE TABLE `electric_vehicle_population_data` (
  `VIN (1-10)` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `County` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Postal Code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Model Year` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Make` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Model` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Electric Vehicle Type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Clean Alternative Fuel Vehicle (CAFV) Eligibility` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Electric Range` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Base MSRP` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Legislative District` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DOL Vehicle ID` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Vehicle Location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Electric Utility` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `2020 Census Tract` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
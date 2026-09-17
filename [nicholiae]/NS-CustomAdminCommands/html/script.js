window.addEventListener("message", function (event) {
    const data = event.data;
    if (data.action === "ProfileList") {
		
        const garageLabel = data.garageLabel;
        const vehicles = data.vehicles;
		
        populateVehicleList(garageLabel, vehicles);
        displayUI();
    }
});

document.addEventListener("keydown", function (event) {
    if (event.key === "Escape") {
        closeGarageMenu();
    }
});

function closeGarageMenu() {
    const container = document.querySelector(".container");
    container.style.display = "none";

    fetch("https://NS-CustomAdminCommands/closeGarage", {
        method: "POST",
        headers: {
            "Content-Type": "application/json; charset=UTF-8",
        },
        body: JSON.stringify({}),
    })
        .then((response) => response.json())
        .then((data) => {
            if (data === "ok") {
                return;
            } else {
                console.error("Failed to close Garage UI");
            }
        });
}

function displayUI() {
    const container = document.querySelector(".container");
    container.style.display = "block";
}

function populateVehicleList(garageLabel, vehicles) {
    const vehicleContainerElem = document.querySelector(".vehicle-table");
    const fragment = document.createDocumentFragment();

    while (vehicleContainerElem.firstChild) {
        vehicleContainerElem.removeChild(vehicleContainerElem.firstChild);
    }

    const garageHeader = document.getElementById("garage-header");
    garageHeader.textContent = garageLabel;
	var count = 0;
    vehicles.forEach((v) => {
		count = count + 1;
        const vehicleItem = document.createElement("div");
        vehicleItem.classList.add("vehicle-item");

        // Vehicle Info: Name, Plate & Mileage
        const vehicleInfo = document.createElement("div");
        vehicleInfo.classList.add("vehicle-info");
		
        const profileName = document.createElement("span");
        profileName.classList.add("profile-name");
        profileName.textContent = v.profileName;
        vehicleInfo.appendChild(profileName);

        const plate = document.createElement("span");
        plate.classList.add("plate");
        plate.textContent = v.plate;
        vehicleInfo.appendChild(plate);

        const financeDriveContainer = document.createElement("div");
        financeDriveContainer.classList.add("finance-drive-container");
		
        // Drive Button
        let status = v.profileName;

        const selectButton = document.createElement("button");
        selectButton.classList.add("drive-btn");
        selectButton.textContent = status;
        selectButton.style.backgroundColor = "#126113";

        selectButton.onclick = function () {
            if (selectButton.disabled) return;

            const vehicleData = {
                plate: v.plate,
                profile: v.profileName,
            };
                fetch("https://NS-CustomAdminCommands/selectProfile", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json; charset=UTF-8",
                    },
                    body: JSON.stringify(vehicleData),
                })
                    .then((response) => response.json())
                    .then((data) => {
                        if (data === "ok") {
                            closeGarageMenu();
                        } else {
                            console.error("Failed to close Garage UI.");
                        }
                    });
        };
        financeDriveContainer.appendChild(selectButton);

        const deleteButton = document.createElement("button");
        deleteButton.classList.add("drive-btn");
        deleteButton.textContent = "Delete Profile";
        deleteButton.style.backgroundColor = "#611212";

        deleteButton.onclick = function () {
            if (deleteButton.disabled) return;

            const vehicleData = {
                plate: v.plate,
                profile: v.profileName,
            };
                fetch("https://NS-CustomAdminCommands/deleteProfile", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json; charset=UTF-8",
                    },
                    body: JSON.stringify(vehicleData),
                })
                    .then((response) => response.json())
                    .then((data) => {
                        if (data === "ok") {
                            closeGarageMenu();
                        } else {
                            console.error("Failed to close Garage UI.");
                        }
                    });
        };
        financeDriveContainer.appendChild(deleteButton);
		
        const updateProfile = document.createElement("button");
        updateProfile.classList.add("drive-btn");
        updateProfile.textContent = "Update Profile";
        updateProfile.style.backgroundColor = "#e7e72a";
		updateProfile.style.color = "#000000";
		
        updateProfile.onclick = function () {
            if (updateProfile.disabled) return;

            const vehicleData = {
                plate: v.plate,
                profile: v.profileName,
            };
                fetch("https://NS-CustomAdminCommands/updateProfile", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json; charset=UTF-8",
                    },
                    body: JSON.stringify(vehicleData),
                })
                    .then((response) => response.json())
                    .then((data) => {
                        if (data === "ok") {
                            closeGarageMenu();
                        } else {
                            console.error("Failed to close Garage UI.");
                        }
                    });
        };
        financeDriveContainer.appendChild(updateProfile);
		
		
        vehicleItem.appendChild(financeDriveContainer);

        // Progress Bars: Fuel, Engine, Body
        const stats = document.createElement("div");
        stats.classList.add("stats");

        // const maxValues = {
            // fuel: 100,
            // engine: 1000,
            // body: 1000,
        // };

        // ["fuel", "engine", "body"].forEach((statLabel) => {
            // const stat = document.createElement("div");
            // stat.classList.add("stat");
            // const label = document.createElement("div");
            // label.classList.add("label");
            // label.textContent = statLabel.charAt(0).toUpperCase() + statLabel.slice(1);
            // stat.appendChild(label);
            // const progressBar = document.createElement("div");
            // progressBar.classList.add("progress-bar");
            // const progress = document.createElement("span");
            // const progressText = document.createElement("span");
            // progressText.classList.add("progress-text");
            // const percentage = (v[statLabel] / maxValues[statLabel]) * 100;
            // progress.style.width = percentage + "%";
            // progressText.textContent = Math.round(percentage) + "%";

            // if (percentage >= 75) {
                // progress.classList.add("bar-green");
            // } else if (percentage >= 50) {
                // progress.classList.add("bar-yellow");
            // } else {
                // progress.classList.add("bar-red");
            // }

            // progressBar.appendChild(progressText);
            // progressBar.appendChild(progress);
            // stat.appendChild(progressBar);
            // stats.appendChild(stat);
            // vehicleItem.appendChild(stats);
        // });

        fragment.appendChild(vehicleItem);
    });
	const newDriveContainer = document.createElement("div");
	newDriveContainer.classList.add("new-drive-container");

	const newProfile = document.createElement("button");
	newProfile.classList.add("drive-btn");
	newProfile.textContent = "New Profile";
    newProfile.style.backgroundColor = "#ffffff";
    newProfile.style.color = "#000000";

	newProfile.onclick = function () {
		if (newProfile.disabled) return;

		const vehicleData = {
			counts: count+1,
		};
			fetch("https://NS-CustomAdminCommands/saveNewProfile", {
				method: "POST",
				headers: {
					"Content-Type": "application/json; charset=UTF-8",
				},
				body: JSON.stringify(vehicleData),
			})
				.then((response) => response.json())
				.then((data) => {
					if (data === "ok") {
						closeGarageMenu();
					} else {
						console.error("Failed to close Garage UI.");
					}
				});
	};
	newDriveContainer.appendChild(newProfile);
	
    vehicleContainerElem.appendChild(newDriveContainer);
    vehicleContainerElem.appendChild(fragment);
}

# Fine Sun Sensor (FSS) Simulation in MATLAB

This project simulates the behavior of a Fine Sun Sensor using a pinhole model with a 4-quadrant photodiode. The simulation allows testing of the sensor’s angular response and precision across a range of incident sun angles (α, β).

---

## Sensor Model Overview

- **Sensor Area**: 10 mm × 10 mm
- **Quadrants**: 4 equal areas (5 mm × 5 mm each)
- **Aperture (Pinhole)**: 5 mm × 5 mm
- **Height of Aperture Above Sensor**: 5 mm
- **Field of View**: ±26.5° in both α (elevation) and β (azimuth) directions

The pinhole projects a square light spot onto the sensor surface. The displacement of this spot, based on the sun vector, determines the relative illumination of each quadrant.

---

## Key Concepts Simulated

- **Overlap Calculation**: Using 'rectint()' to determine the area of the light spot that falls into each quadrant.
- **Signal Calculation**: Each quadrant's output is proportional to the overlap area, with added Gaussian noise ('randn()').
- **Angle Recovery**: Uses normalized difference of quadrant outputs to estimate 'S_α', 'S_β', and recover original angles via:
- 
α = atan(S_α * tan(α_max));
β = atan(S_β * tan(β_max))



---

## 📊 Simulation Results

The script can be extended to:
- Run simulations over a sweep of α and β angles from –30° to +30°
- Visualize error surfaces and validate angular recovery accuracy
- Investigate effects of noise and nonlinearity at FOV edges

---

## 📁 Files

- `fss_model.m`: Main simulation script that visualizes spot projection and quadrant geometry
- `fss_overlap_func.m`: Wrapper using `rectint()` for computing area intersections
- `fss_simulate_fixed.m`: Modular simulation function for a given (α, β) pair
- `fss_sweep_plot.m` (optional): Loop over input angles and plot error heatmaps or graphs

---

## 🛠 Requirements

- MATLAB R2018 or newer
- No toolboxes required — uses built-in functions only

---

## 📷 Example Visualization

Spot projection for a random sun vector:

Alpha = -12.3°, Beta = 8.6°
[Q1, Q2, Q3, Q4] calculated → S_alpha, S_beta → Reconstructed angles


---

## 👨‍💻 Author

Orkhan Alili 
Contact: chemistr.orxan98@gmail.com 


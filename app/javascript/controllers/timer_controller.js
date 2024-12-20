import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
export default class extends Controller {
  static targets = ["timer"];
  static values = { startTime: String }

  connect() {
    this.timerInterval = null;
    this.start();
  }

  start() {
    if (this.timerInterval) return; // Prevent multiple intervals

    // Parse the string to a timestamp
    const startTimeParsed = new Date(this.startTimeValue).getTime();
    this.startTime = !isNaN(startTimeParsed) ? startTimeParsed : Date.now();

    this.timerInterval = setInterval(() => this.updateTime(), 1000);
    this.updateTime(); // Update the timer immediately
  }

  updateTime() {
    const elapsedTime = Date.now() - this.startTime;
    const hours = String(Math.floor(elapsedTime / (1000 * 60 * 60))).padStart(2, "0");
    const minutes = String(Math.floor((elapsedTime % (1000 * 60 * 60)) / (1000 * 60))).padStart(2, "0");
    const seconds = String(Math.floor((elapsedTime % (1000 * 60)) / 1000)).padStart(2, "0");
    this.timerTarget.textContent = `${hours}:${minutes}:${seconds}`;
  }

  disconnect() {
    // Clear the interval when the controller disconnects
    clearInterval(this.timerInterval);
    this.timerInterval = null;
  }
}

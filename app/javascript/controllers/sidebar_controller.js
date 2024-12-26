import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  connect() {
    const isExpanded = sessionStorage.getItem("expanded") === "true";
    isExpanded ? this.expandSideNav() : this.collapseSideNav();
  }

  toggleSideNav() {
    const isExpanded = sessionStorage.getItem("expanded") === "true";
    isExpanded ? this.collapseSideNav() : this.expandSideNav();
  }

  expandSideNav() {
    const mainContainer = document.getElementById("mainContainer");
    const sideBarTexts = document.querySelectorAll(".string");

    mainContainer.classList.remove("grid-cols-[80px,1fr]");
    mainContainer.classList.add("grid-cols-[auto,1fr]");

    sideBarTexts.forEach((text) => {
      text.classList.remove("hidden");
    });

    sessionStorage.setItem("expanded", "true");
  }

  collapseSideNav() {
    const mainContainer = document.getElementById("mainContainer");
    const sideBarTexts = document.querySelectorAll(".string");

    mainContainer.classList.remove("grid-cols-[auto,1fr]");
    mainContainer.classList.add("grid-cols-[80px,1fr]");

    sideBarTexts.forEach((text) => {
      text.classList.add("hidden");
    });

    sessionStorage.setItem("expanded", "false");
  }
}

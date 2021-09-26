import { html, LitElement } from "lit";
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

export class TodoCalendar extends LitElement {
  static get properties() {
    return {
      events: {
        type: Array
      }
    };
  }

  firstUpdated() {
    this.calendar = new Calendar(this, {
      plugins: [dayGridPlugin],
      initialView: 'dayGridMonth',
      events: this.events
    });
    this.calendar.render();
  }

  updated() {
    this.calendar.getEventSources()[0].remove();
    this.calendar.addEventSource({events: this.events});
  }

  createRenderRoot() { return this; }

}

customElements.define('todo-calendar', TodoCalendar);

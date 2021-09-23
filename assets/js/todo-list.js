import {LitElement, html} from 'lit';

class TodoList extends LitElement {
  static properties  = {
    items: {
      type: Array
    }
  }

  render() {
    return html`
      <ul>
        ${this.items.map(item => html`<li>${item}</li>`)}
      </ul>
    `
  }
}

customElements.define('todo-list', TodoList);
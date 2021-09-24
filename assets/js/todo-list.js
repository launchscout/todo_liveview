import {LitElement, html} from 'lit';

class TodoList extends LitElement {
  static properties  = {
    items: {
      type: Array
    }
  }

  get itemInput() { return this.shadowRoot.querySelector('input[name="todo_item"]'); }

  addTodo(_event) {
    this.dispatchEvent(new CustomEvent('add_todo', {detail: {item: this.itemInput.value}}));
    this.itemInput.value = '';
  }

  render() {
    return html`
      <ul>
        ${this.items.map(item => html`<li>${item}</li>`)}
      </ul>
      <input name="todo_item" />
      <button @click=${this.addTodo}>Add Item</button>
    `
  }
}

customElements.define('todo-list', TodoList);
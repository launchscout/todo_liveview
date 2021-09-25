import {LitElement, html} from 'lit';

class TodoList extends LitElement {
  static properties  = {
    items: {
      type: Array
    }
  }

  get itemInput() { return this.shadowRoot.querySelector('input[name="todo_item"]'); }
  get dueDateInput() { return this.shadowRoot.querySelector('input[name="due_date"]'); }

  addTodo(_event) {
    this.dispatchEvent(new CustomEvent('add_todo', {
      detail: {
        item: this.itemInput.value, 
        due_date: this.dueDateInput.value
      }
    }));
    this.itemInput.value = '';
    this.dueDateInput.value = '';
  }

  render() {
    return html`
      <ul>
        ${this.items.map(item => html`<li>${item.item}</li>`)}
      </ul>
      <input name="todo_item" />
      <input type="date" name="due_date" />
      <button @click=${this.addTodo}>Add Item</button>
    `
  }
}

customElements.define('todo-list', TodoList);
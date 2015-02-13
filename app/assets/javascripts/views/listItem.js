FiveSeconds.Views.ListItemView = Backbone.View.extend({
  initialize: function (options) {
    this.expCounter = options.counter;
    this.description = options.description;
    this.counter = 0;
  },

  template: JST["listItem"],

  events: {
    "click a": "addItem"
  },

  addItem: function (e) {
    e && e.preventDefault();
    e && $(e.target).remove();
    this.$el.append(this.$itemField());
    this.counter++;
  },

  $itemField: function () {
    return this.template({
      expCounter: this.expCounter,
      itemCounter: this.counter,
      question: this.question(),
      description: this.description
    });
  },

  question: function () {
    if (!this.counter) {
      return "What did you do here?";
    } else {
      return "What else did you do here?";
    }
  }
});
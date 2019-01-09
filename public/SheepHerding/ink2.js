// Experiment trying to match inkjs but written as a JS app instead of a C# app.
class INK {
  constructor(story) {
    // Create a deep copy of the story data.
    this.data = JSON.parse(JSON.stringify(story));
    // For old style API
    this.pointer = 0;
  }
  get canContinue() {
    return true;
  }

  Continue(story) {
    const token = this.data.root[this.pointer];
    console.log('continue 2', token);
    return 'Rose';
  }
}
window.INK = INK;

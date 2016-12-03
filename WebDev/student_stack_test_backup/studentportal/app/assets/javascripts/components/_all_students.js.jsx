var AllStudents = React.createClass({

  getInitialState() {
    return {
      students: []
    }
  },

  componentDidMount() {
    console.log("Component mounted");

    // Get the data from the server and assign it to the students object
    $.getJSON('/api/v1/students.json', (response) => {this.setState({students: response})});
  },

  render() {
    var students = this.state.students.map((student) => {
      return (
        <div key={student.id}>
          <h3>{student.first_name}</h3>
          <h2>{student.last_name}</h2>
          <h3>{student.cohort}</h3>
        </div>
      )
    });

    return (
      <div>
        {students}
      </div>
    )
  }

});
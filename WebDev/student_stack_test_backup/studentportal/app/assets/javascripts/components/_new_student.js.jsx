var NewStudent = React.createClass ({

  handleClick() {
    var firstName = this.refs.firstname.value;
    var lastName = this.refs.lastname.value;
    var cohort = this.refs.cohort.value;

    $.ajax({ 
      url: '/api/v1/items', 
      type: 'POST', 
      data: { item: { firstname: firstName,  lastname: lastName, cohort: cohort } },
      success: (response) => { console.log('Post request successful', response); 
      } 
    });
  },

  render() {
    return (
      <div>
        <input ref="firstname" placeholder="Enter the student's first name" />
        <input ref="lastname" placeholder="Enter the student's last name" />
        <input ref="cohort" placeholder="Enter the student's cohort" />
        <button onClick={this.handleClick}>Submit</button>
      </div>
    )
  }

});
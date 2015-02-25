module SubmissionsHelper
  def submission_workflow(submission_object)
    submission_object.current_state
  end

  def workflow_state_helper_method(submission)
    if submission.current_state == "begin"
        "submission has been sent"
    elsif submission.current_state == "submit"
        "Submission is submitted"
    elsif submission.current_state == "review"
        "Submission is being reviewed" 
    elsif submission.current_state == "complete"
        "Submission is complete"
    end 
  end

  def submission_state?(submission)
    array_of_links = []
    begin_links = [
      (link_to "Submit", submit_assignment_submission_path(@assignment, @submission), method: :patch),
      (link_to "Review", review_assignment_submission_path(@assignment, @submission), method: :patch),
      (link_to "Complete", complete_assignment_submission_path(@assignment, @submission), method: :patch),
    ]
    submit_links = [
      (link_to "Review", review_assignment_submission_path(@assignment, @submission), method: :patch),
      (link_to "Complete", complete_assignment_submission_path(@assignment, @submission), method: :patch),

    ]
    review_links = [
      (link_to "Submit", submit_assignment_submission_path(@assignment, @submission), method: :patch),
      (link_to "Complete", complete_assignment_submission_path(@assignment, @submission), method: :patch),

    ]

    if submission.begin?
      array_of_links.push(begin_links)
      return array_of_links.join(' | ').html_safe
    elsif submission.submit?
      array_of_links.push(submit_links)
      return array_of_links.join(' | ').html_safe
    elsif submission.review?
      array_of_links.push(review_links)
      return array_of_links.join(' | ').html_safe
    else  
    end
  end


end


  
  
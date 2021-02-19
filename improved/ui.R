# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
# Developed with R version 3.3.2 (64-bit)
library(dplyr)
library(stringr)
library(png)
library(shinyjs)
library(DT)
library(visNetwork)
library(rintrojs)

source("carouselPanel.R")

# Panel div for visualization
# override the currently broken definition in shinyLP version 1.1.0
panel_div <- function(class_type, content) {
    div(class = sprintf("panel panel-%s", class_type),
        div(class = "panel-body", content)
    )
}

shinyUI(navbarPage(title = img(src="cmu_logo.png", height = "40px"), id = "navBar",
                   theme = "paper.css",
                   collapsible = TRUE,
                   inverse = TRUE,
                   windowTitle = "heinz_participatory_design_study",
                   position = "fixed-top",
                   footer = includeHTML("./www/include_footer.html"),
                   header = tags$style(
                       ".navbar-right {
                       float: right !important;
                       }",
                       "body {padding-top: 75px;}"),
                   
                   tabPanel("HOME", value = "home",
                            
                            shinyjs::useShinyjs(),
                            
                            tags$head(tags$script(HTML('
                                                       var fakeClick = function(tabName) {
                                                       var dropdownList = document.getElementsByTagName("a");
                                                       for (var i = 0; i < dropdownList.length; i++) {
                                                       var link = dropdownList[i];
                                                       if(link.getAttribute("data-value") == tabName) {
                                                       link.click();
                                                       };
                                                       }
                                                       };
                                                       '))),
                            fluidRow(
                                HTML("
                                     
                                     <section class='banner'>
                                     <h2 class='parallax'>Participatory Design Study</h2>
                                     <p class='parallax_description'>This task is part of a research study conducted
                                     by Lingwei Cheng and Alex Chouldechova at Carnegie Mellon University 
                                     and is funded by Amazon Web Services.</p>
                                     </section>
                                     ")
                                ),
                            
                            # tags$head(includeScript("google-analytics.js")),
                            
                            # A header level row for the title of the app (if needed)  
                            # fluidRow(
                            #     shiny::HTML("<br><br><center> <h1></h1> </center>
                            #                 <br>
                            #                 <br>"),
                            #     style = "height:250px;"),
                            
                            # fluidRow(
                            #     style = "height:250px; padding: 125px 0px;",
                            #     shiny::HTML("<center> <h1>Welcome to the Career PathFinder</h2></center>"),
                            #     shiny::HTML("<center> <h5><i>Like stops on a map, a career path pinpoints your next job, 
                            #                 the job after that, and beyond.</i></h5> </center>")
                            # ),
                            
                            # fluidRow(
                            #     
                            #     style = "height:25px;"),
                            
                            # fluidRow(
                            #     column(2),
                            #     
                            #     column(3,
                            #            div(style="display: inline-block;padding: 100px 0px;",
                            #                HTML("<h3>What <span style='font-weight:bold'>career planning</span> questions are you looking to answer?</h3>")
                            #            )
                            #     ),
                            #     
                            #     column(5,
                            #            
                            #            carouselPanel(
                            #                # tags$a(href = "#FAQ", 
                            #                #        tags$img(src = "screen_capture_absenteeism_2.jpg", width = "615px")), # experiment diff size img - fixed height 1080px and width 1900px
                            #                tags$img(src = "original1.svg", class = "img-responsive center-block"),
                            #                tags$img(src = "original2.svg", class = "img-responsive center-block"),
                            #                tags$img(src = "original3.svg", class = "img-responsive center-block"),
                            #                tags$img(src = "original4.svg", class = "img-responsive center-block"),
                            #                tags$img(src = "original5.svg", class = "img-responsive center-block")
                            #                # tags$a(href = "https://geom.shinyapps.io/word", tags$img(src = "screen_capture_word_2.jpg", width = "615px"))
                            #                
                            #            )
                            #     )
                            # ),
                            # 
                            # fluidRow(
                            #     
                            #     style = "height:50px;"),
                            # 
                            # fluidRow(
                            #     style = "height:250px;",
                            #     shiny::HTML("<center> <h4><i>Are you looking to plan a career with the County?</i></h4> </center>"),
                            #     shiny::HTML("<center> <h4><i>Are you curious about the paths real County employees have taken?</i></h4></center>"),
                            #     shiny::HTML("<center> <h4><i>Then you're in the right place.</i></h4></center>")
                            # ),
                            # 
                            # # PAGE BREAK
                            # tags$hr(),
                            
                            # Summary
                            fluidRow(
                                column(3),
                                column(6,
                                       shiny::HTML("<br><br><center> <h1>Summary</h1> </center><br>"),
                                       shiny::HTML("<h5>You will be asked to complete predictive or evaluation tasks 
                                                   for hypothetical settings in education using either your own 
                                                   judgement or that of a statistical model. The tasks are built using 
                                                   publicly available data and contain no sensitive information. Your work 
                                                   product and responses will not impact the relevant policies. 
                                                   You might want to participate in the research if you want to learn more 
                                                   about algorithmic decision support systems. You might not want to 
                                                   participate in the research if you feel uncomfortable with the settings of the experiment..</h5>")
                                       ),
                                column(3)
                                       ),
                            
                            fluidRow(
                                
                                style = "height:50px;"),
                            
                            # PAGE BREAK
                            tags$hr(),
                            
                            # Purpose
                            fluidRow(
                                column(3),
                                column(6,
                                       shiny::HTML("<br><br><center> <h1>Purpose</h1> </center><br>"),
                                       shiny::HTML("<h5>The main purpose of the research is to study participants’ 
                                                   preference for using statistical models. We will perform statistical 
                                                   analysis to identify and extract patterns in the answers to this survey. 
                                                   <b>However, We can’t tell you the full purpose of the research in advance,
                                                   but we’ll debrief you at the end of the study. 
                                                   You will have the opportunity to ask questions.</b></h5>")
                                       ),
                                column(3)
                                       ),
                            
                            fluidRow(
                                
                                style = "height:50px;"),
                            
                            # PAGE BREAK
                            tags$hr(),
                            
                            # Procedure
                            fluidRow(
                                column(3),
                                column(6,
                                       shiny::HTML("<br><br><center> <h1>Procedure</h1> </center><br>"),
                                       shiny::HTML("<h5>For the next 20 scenarios, you will determine if a high school should 
                                       hypothetically receive additional funding. For making the official recommendation, 
                                       you will receive information of the school and if you choose, an additional 
                                       recommendation made by a statistical model.
                                        <br><br>
                                        For the funding decision, you can choose to build a statistical model that estimates how 
                                        likely the school will perform worse in overall performance for next year. 
                                        The overall school performance is determined by the school board using information 
                                        including but not limited to student test score performance, student academic growth, 
                                        closing of achievement gaps, school culture and climate, attendance, graduation, and
                                        preparation for post-graduation success.  <u>If you choose to build the statistical model,
                                        you will be able to decide how the statistical model process the school information by 
                                        choosing a suitable algorithm, review the model’s performance, and decide whether you want to use it.</u>
                                        <br><br>
                                        For making the official recommendation, you will receive information of the school.
                                        You can choose to either use your own judgement exclusively or use the risk estimates
                                        by the model exclusively as your official recommendation. <u>If you choose to use the model, 
                                        please notice that the model’s recommendation is not binding. You can either agree or 
                                        disagree with the recommendation.<u></h5>")
                                       ),
                                column(3)
                                       ),
                            
                            fluidRow(
                                
                                style = "height:50px;"),
                            
                            # PAGE BREAK
                            tags$hr(),
                            
                            # TAB PANELS FOR requirements, risks, benefits, compensation & costs, and future use of information
                            fluidRow(
                                column(3),
                                column(6,
                                       
                                       tags$div(class = "wrap",
                                                div(class = "center",
                                                    style="display: inline-block;vertical-align:top; width: 600px;",
                                                    tabsetPanel(type = "tabs",
                                                                tabPanel("Requirments", shiny::HTML("<h5>Participation in this study is limited 
                                                                                    to individuals age 18 and older, and US residents.</h5>")),
                                                                tabPanel("Risks", shiny::HTML("<h5>There are no risks for participating in this study 
                                                                              beyond those associated with normal computer use and a minor 
                                                                              risk of breach of confidentiality.</h5>")),
                                                                tabPanel("Benefits", shiny::HTML("<h5>By completing this task, you will be more familiar
                                                                                 with statistical models used in education setting. 
                                                                                 More broadly, this study may benefit society by improving 
                                                                                 the understanding of human-computer interaction.</h5>")),
                                                                tabPanel("Compensation & Costs", shiny::HTML("<h5>The base rate for workers is 10$/hour. <br><br>
                                
                                                            For the mechanical task where the participants are asked to make as accurate 
                                                            prediction as possible, they will be rewarded bonus based on the accuracy of their prediction:<br><br>
                                                            
                                                            $E—within X percentiles of a student’s actual percentiles on average 
                                                            $D—within X percentiles of a student’s actual percentiles on average 
                                                            $C—within X percentiles of a student’s actual percentiles on average 
                                                            $B—within X percentiles of a student’s actual percentiles on average 
                                                            $A—within X percentiles of a student’s actual percentiles on average<br><br>
                                                            
                                                            (The exact amount will be determined through simulation and trial on the platform)<br><br> 
                                                            
                                                            There will be no cost to you if you participate in this study.  
                                                            </h5>")),
                                                                tabPanel("Future Use of Information", shiny::HTML("<h5>In the future, once we have removed all 
                                                                                                  identifiable information from your data, we may use the 
                                                                                                  data for our future research studies, or we may distribute 
                                                                                                  the data to other researchers for their research studies. 
                                                                                                  We would do this without getting additional informed consent
                                                                                                  from you (or your legally authorized representative).  
                                                                                                  Sharing of data with other researchers will only be done in 
                                                                                                  such a manner that you will not be identified.</h5>"))
                                                    )
                                                ))),
                                column(3)
                            ),
                            
                            fluidRow(
                                
                                style = "height:50px;"),
                            
                            # PAGE BREAK
                            tags$hr(),
                            
                            # Confidentiality
                            fluidRow(
                                column(3),
                                column(6,
                                       shiny::HTML("<br><br><center> <h1>Confidentiality</h1> </center><br>"),
                                       shiny::HTML("<h5>Other than your Amazon Mechanical Turk serial number, we will collect 
                                       the following demographic information: age, gender, race, level of education, and state of residence. 
                                       We note that the Amazon Mechanical Turk serial number could be linked to your public profile page, 
                                       so you might consider what information you choose to share on your public profile. 
                                       These serial numbers will not be shared with anyone outside the research team and will 
                                       only be used to handle financial transactions on the platform. Note, however, 
                                       that de-identified data may be shared outside the research team.<br><br>

                                        By participating in this research, you understand and agree that Carnegie Mellon may 
                                        be required to disclose your consent form, data and other personally identifiable 
                                        information as required by law, regulation, subpoena or court order.  Otherwise, your 
                                        confidentiality will be maintained in the following manner:  Your data and consent form will 
                                        be kept separate. Your consent form will be stored in a secure location on Carnegie Mellon 
                                        property and will not be disclosed to third parties. By participating, you understand and agree 
                                        that the data and information gathered during this study may be used by Carnegie Mellon and published
                                        and/or disclosed by Carnegie Mellon to others outside of Carnegie Mellon.  However, your name, address, 
                                        contact information and other direct personal identifiers will not be mentioned in any such publication
                                        or dissemination of the research data and/or results by Carnegie Mellon. Note that per regulation all
                                        research data must be kept for a minimum of 3 years.
                                        </h5>")
                                       ),
                                column(3)
                                       ),
                            
                            fluidRow(
                                
                                style = "height:50px;"),
                            
                            # PAGE BREAK
                            tags$hr(),
                            
                            # Right to Ask Questions & Contact Information
                            fluidRow(
                                column(3),
                                column(6,
                                       shiny::HTML("<br><br><center> <h1>Right to Ask Questions & Contact Information</h1> </center><br>"),
                                       shiny::HTML("<h5>If you have any questions about this study, you should feel free to ask them 
                                       by contacting the Principal Investigator now at Lingwei Cheng, Heinz College at Carnegie Mellon University,
                                       <a href='lingweic@andrew.cmu.edu'>lingwei@andrew.cmu.edu</a>. If you have questions later, desire additional information, or wish to withdraw your 
                                       participation please contact the Principal Investigator by mail, phone or e-mail in accordance with the contact 
                                       information listed above.  <br><br>
    
                                        If you have questions pertaining to your rights as a research participant; 
                                        or to report concerns to this study, you should contact the Office of Research integrity 
                                        and Compliance at Carnegie Mellon University.  <br><br>
                                        Email: <a href='irb-review@andrew.cmu.edu'>irb-review@andrew.cmu.edu</a> <br>
                                        Phone: <a href='tel:412-268-1901'>412-268-1901</a> or <a href='tel:412-268-5460'>412-268-5460</a>
                                        </h5>")
                                ),
                                column(3)
                            ),
                            
                            fluidRow(
                                
                                style = "height:50px;"),
                            
                            # PAGE BREAK
                            tags$hr(),
                            
                            
                            # Voluntary Participation
                            fluidRow(
                                column(3),
                                column(6,
                                       shiny::HTML("<br><br><center> <h1>Voluntary Participation</h1> </center><br>"),
                                       shiny::HTML("<h5>Your participation in this research is voluntary.  
                                       You may discontinue participation at any time during the research activity.  
                                       You may print a copy of this consent form for your records. 
                                        </h5>")
                                ),
                                column(3)
                            ),
                            
                            fluidRow(
                                
                                style = "height:50px;"),
                            
                            # PAGE BREAK
                            tags$hr(),
                            
                            # 
                            # # BUTTONS TO START
                            # 
                            # 
                            # fluidRow(
                            #     
                            #     style = "height:50px;"),
                            # 
                            # # PAGE BREAK
                            # tags$hr(),
                            # 
                            # # INSTRUCTIONAL SECTION
                            # fluidRow(
                            #     shiny::HTML("<br><br><center> <h1>Career Planning Made Easy.</h1> </center>
                            #                 <br>")
                            #     ),
                            # 
                            # fluidRow(
                            #     column(3),
                            #     
                            #     column(2,
                            #            div(class="panel panel-default", 
                            #                div(class="panel-body",  width = "600px",
                            #                    align = "center",
                            #                    div(
                            #                        tags$img(src = "one.svg", 
                            #                                 width = "50px", height = "50px")
                            #                    ),
                            #                    div(
                            #                        h5(
                            #                            "Pick a job to start your path. You may use your current job, or a job you're interested in exploring."
                            #                        )
                            #                    )
                            #                )
                            #            )
                            #     ),
                            #     column(2,
                            #            div(class="panel panel-default",
                            #                div(class="panel-body",  width = "600px", 
                            #                    align = "center",
                            #                    div(
                            #                        tags$img(src = "two.svg", 
                            #                                 width = "50px", height = "50px")
                            #                    ),
                            #                    div(
                            #                        h5(
                            #                            "Then from that job, review the set of next jobs that people have moved into during their careers. Review information about these choices and select your next career step."
                            #                        )
                            #                    )
                            #                )
                            #            )
                            #     ),
                            #     column(2,
                            #            div(class="panel panel-default",
                            #                div(class="panel-body",  width = "600px", 
                            #                    align = "center",
                            #                    div(
                            #                        tags$img(src = "three.svg", 
                            #                                 width = "50px", height = "50px")),
                            #                    div(
                            #                        h5(
                            #                            "Plan up to five steps out in your career. When you're ready, you may save or print out your personalized report."
                            #                        )
                            #                    )
                            #                )
                            #            )
                            #     ),
                            #     column(3)
                            #     
                            # ),
                            # 
                            # # Embedded Video from Vimeo on how to use this tool
                            # # fluidRow(
                            # #     column(3),
                            # #     column(6,
                            # #            tags$embed(src = "https://player.vimeo.com/video/8419440",
                            # #                       width = "640", height = "360") 
                            # #     ),
                            # #     column(3)
                            # # ),
                            # 
                            # fluidRow(
                            #     
                            #     style = "height:50px;"),
                            # 
                            # # PAGE BREAK
                            # tags$hr(),
                            # 
                            # # AFTERWARD
                            # fluidRow(
                            #     column(3),
                            #     column(6,
                            #            shiny::HTML("<br><br><center> <h1>How does it fit in the big picture?</h1> </center><br>"),
                            #            shiny::HTML("<h5>Building a career path is just one part of effective career 
                            #                        planning and development. You should also establish a career plan 
                            #                        to outline <i>how</i> you will achieve your professional goals. Our
                            #                        Career Planning Guide provides information to help you establish 
                            #                        a plan for making your career path a reality.</h5>")
                            #            ),
                            #     column(3)
                            #            ),
                            # 
                            # fluidRow(
                            #     
                            #     style = "height:50px;"),
                            # 
                            # # PAGE BREAK
                            # tags$hr(),
                            
                            fluidRow(shiny::HTML("<br><br><center> <h1>Ready to Get Started?</h1> </center>
                                                 <br>")
                            ),
                            fluidRow(
                                column(3),
                                column(6,
                                       tags$div(align = "center", 
                                                # wellPanel(textInput("userName", "Username"),
                                                #           br(),actionButton("Login", "Log in")),
                                                # tags$textarea(label = "Login"),
                                                tags$a("Login", 
                                                       onclick="fakeClick('careerPF')", 
                                                       class="btn btn-primary btn-lg")
                                       )
                                ),
                                column(3)
                            ),
                            fluidRow(style = "height:25px;"
                            )
                            
                            ), 
                   
                   # Closes the first tabPanel called "Home"

                   tabPanel("Survey", value = "careerPF",

                            sidebarLayout(

                                sidebarPanel( width = 3,
                                              introjsUI(),

                                              tags$div(
                                                  actionButton("help", "Reminder about Bonus Rules"),
                                                  style = "height:50px;"
                                              ),
                                              useShinyjs(),

                                              tags$div(
                                                  style = "height:50px;",
                                                  introBox(
                                                      tags$div(
                                                          style = "height:50px;",
                                                          actionLink("settings", "Settings",
                                                                     icon = icon("sliders", class = "fa-2x"))),
                                                      data.step = 6,
                                                      data.intro = "Settings is where you can set options that affect the graph and career statistics."
                                                  ),
                                                  radioButtons("selectData",
                                                               label = "How many years of data do you want to include?",
                                                               choices = c("30 Years",
                                                                           "15 Years"),
                                                               inline = TRUE,
                                                               width = "100%"
                                                  ),
                                                  selectizeInput("changeAvatar", "Change Icon:",
                                                                 choices = c(
                                                                             # "Traveler" = "traveler",  # not compatible with new FA
                                                                             "Map Marker" = "map-marker",
                                                                             "Rocket" = "rocket",
                                                                             # "Paper Plane" = "paper-plane",  # not compatible with new FA
                                                                             "Leaf" = "leaf"),
                                                                 selected = "rocket"
                                                  ),
                                                  textInput("userName", "Add your name:", value = ""),

                                                  tags$div(
                                                      style = "height:50px;",

                                                      uiOutput("printInput1"),
                                                      uiOutput("printInput2"),
                                                      uiOutput("printInput3"),
                                                      uiOutput("printInput4"),
                                                      uiOutput("printInput5")
                                                  )
                                              )
                                ),  # Closes sidebarPanel
                                mainPanel( width = 8,
                                           fluidRow(

                                               tags$style(type="text/css",
                                                          ".shiny-output-error { visibility: hidden; }",
                                                          ".shiny-output-error:before { visibility: hidden; }"
                                               ),
                                               introBox(
                                                   panel_div(class_type = "default",
                                                             content = tags$div(
                                                                 uiOutput("displayName"),
                                                                 visNetwork::visNetworkOutput("visTest", height = "200px")
                                                             )
                                                   ),
                                                   data.step = 4,
                                                   data.intro = "Your selections will be displayed here in a graph."
                                               )
                                           ),
                                           fluidRow(
                                               div(class="panel panel-default",
                                                   div(class="panel-body",  width = "600px",
                                                       tags$div(class = "wrap",
                                                                div(class = "left",
                                                                    style="display: inline-block;vertical-align:top; width: 150px;",
                                                                    uiOutput("stepNo")
                                                                ),
                                                                div(class = "right",
                                                                    style="display: inline-block;vertical-align:top; width: 150px;",

                                                                    introBox(

                                                                        checkboxInput('returnpdf', 'Save as PDF?', FALSE),
                                                                        data.step = 5, data.intro = "Stay on track with your plans by downloading your path."

                                                                    ),
                                                                    uiOutput("download")
                                                                ),
                                                                div(class = "center",
                                                                    style="display: inline-block;vertical-align:top; width: 150px;",
                                                                    introBox(
                                                                        actionButton("goBack",
                                                                                     label = "Back",
                                                                                     icon = icon("arrow-circle-left", class = "fa-2x"),
                                                                                     width= "100px", height= "40px"),
                                                                        data.step = 3,
                                                                        data.intro = "Go back a step to edit your selection anytime."
                                                                    )
                                                                ),
                                                                # div(style="display: inline-block;vertical-align:top; width: 150px;",
                                                                #     uiOutput("clearBtns")
                                                                # ),
                                                                # actionButton("resetBtn", "Reset All", icon = icon("refresh", class = "fa-2x")),
                                                                div(class = "center",
                                                                    style="display: inline-block;vertical-align:top; width: 150px;",
                                                                    introBox(
                                                                        actionButton("btn1",
                                                                                     label = "Add",
                                                                                     icon = icon("arrow-circle-right", class = "fa-2x"),
                                                                                     width= "100px", height= "40px"),
                                                                        data.step = 2,
                                                                        data.intro = "Confirm your selection by clicking here."
                                                                    )
                                                                )
                                                       ),
                                                       # Insert Table Output
                                                       introBox(
                                                           uiOutput("btns"),
                                                           data.step = 1,
                                                           data.intro = "Start by selecting your first career choice from our list of over 2,000 current job classifications."
                                                       )
                                                   )
                                               ),
                                               plotOutput("myplot")
                                           )
                                )  # Closes the mainPanel
                            )  # Closes the sidebarLayout
                   ),  # Closes the second tabPanel called "Career PathFinder"
#ABOUT
                   tabPanel("ABOUT", value = "about",

                            fluidRow(
                                shiny::HTML("<br><br><center>
                                            <h1>About Participatory Design Study</h1>
                                            <h4>What's behind the data.</h4>
                                            </center>
                                            <br>
                                            <br>"),
                                style = "height:250px;"),
                            fluidRow(
                                div(align = "center",
                                    tags$span(h4("A Brief Introduction of Participatory Design Study"),
                                              style = "font-weight:bold"
                                    ))
                            ),
                            fluidRow(
                                column(3),
                                column(6,
                                       tags$ul(
                                           # tags$li(h6("The need for the Career PathFinder grew out of the fact that it is simply difficult to navigate the classification structure if you do not already know it or know someone who has gone through it.")),
                                           # tags$li(h6("The Workforce and Employee Development team wanted to help others help themselves by providing an online tool that sheds light on the otherwise invisible career paths in the County.")),
                                           # tags$li(h6("In 2016, the Los Angeles County Quality and Productivity Commission granted the seed money that got the ball rolling.")),
                                           # tags$li(h6("We wanted to augment training provided through the Los Angeles County University by helping people see real career opportunities after taking a course that improved their skills.")),
                                           # tags$li(h6("Now, and into the future, we want to be a magnet for top talent and be an employer of choice."))
                                       )
                                ),
                                column(3)
                            ),
                            fluidRow(
                                column(2),
                                column(8,
                                       # Panel for Background on Data
                                       div(class="panel panel-default",
                                           div(class="panel-body",
                                               tags$div( align = "center",
                                                         icon("bar-chart", class = "fa-4x"),
                                                         div( align = "center",
                                                              h5("About the Data")
                                                         )
                                               ),
                                               tags$p(h6("Over 30 years of data were collected, which resulted in nearly 500,000 records of career movement. Several business rules were developed to ensure the data reflected real opportunities in the current classification system.")),
                                               tags$ul(
                                                   tags$li(h6("Any career movement within 30 days of a previous career movement was ignored. Although this represents a small percent of movement, these job transitions may have reflected data entry errors and may have skewed probabilities in jobs with a small number of incumbents.")),
                                                   tags$li(h6("Multiple transfers within the same classification were ignored when there were 2 or more transfers to the same position. Although single transfers were counted, multiple transfers inflated the likelihood that the next step was a transfer.")),
                                                   tags$li(h6("Expired classifications were removed from an individual's career path in the source data, because their path is no longer possible in the current system.")),
                                                   tags$li(h6("Minor demotions were retained in the data to reflect deliberate career choices; however, demotions of a significant percent were excluded."))
                                               )
                                           )
                                       ) # Closes div panel
                                ), # Closes column
                                column(2)
                            ),
                            # TEAM BIO
                            fluidRow(
                                column(3),
                                column(6,
                                       shiny::HTML("<br><br><center> <h5>About the team</h5> </center><br>"),
                                       shiny::HTML("<h6>The Career PathFinder is sponsored by the Los Angeles County
                                                   Department of Human Resources, with financial support from the
                                                   Quality and Productivity Commission. And here is a little information
                                                   about the project team!</h6>")
                                       ),
                                column(3)
                                       ),

                            fluidRow(

                                style = "height:50px;"),

                            fluidRow(
                                column(3),

                                # Marc
                                column(2,
                                       div(class="panel panel-default",
                                           div(class="panel-body",  width = "600px",
                                               align = "center",
                                               div(
                                                   tags$img(src = "man_beard_1.svg",
                                                            width = "50px", height = "50px")
                                               ),
                                               div(
                                                   tags$h5("Marc"),
                                                   tags$h6( tags$i("Visionary & Project Lead"))
                                               ),
                                               div(
                                                   "My County career path started as a Human Resources Analyst."
                                               )
                                           )
                                       )
                                ),
                                # George
                                column(2,
                                       div(class="panel panel-default",
                                           div(class="panel-body",  width = "600px",
                                               align = "center",
                                               div(
                                                   tags$img(src = "man.svg",
                                                            width = "50px", height = "50px")
                                               ),
                                               div(
                                                   tags$h5("George"),
                                                   tags$h6( tags$i("Data Scientist & Programmer"))
                                               ),
                                               div(
                                                   "My County career path started as an Intermediate Typist Clerk."
                                               )
                                           )
                                       )
                                ),
                                # Angela
                                column(2,
                                       div(class="panel panel-default",
                                           div(class="panel-body",  width = "600px",
                                               align = "center",
                                               div(
                                                   tags$img(src = "woman.svg",
                                                            width = "50px", height = "50px")),
                                               div(
                                                   tags$h5("Angela"),
                                                   tags$h6( tags$i("Writer"))
                                               ),
                                               div(
                                                   "My County career path started as an Administrative Assistant."
                                               )
                                           )
                                       )
                                ),
                                column(3)

                            ),
                            fluidRow(style = "height:150px;")
                                )  # Closes About tab

                            )
        
                   )
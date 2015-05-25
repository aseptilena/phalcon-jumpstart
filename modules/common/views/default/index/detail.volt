{% extends "layouts/main.volt" %}

{% block content %}
<!-- Single Post -->
<section class="space-top padding-bottom-2x">
    <div class="container">
        <div class="row">
            <!-- Post Content -->
            <div class="col-lg-9 col-lg-push-3 col-sm-8 col-sm-push-4 padding-bottom">
                <div class="single-post box-float">
                    <div class="inner">
                        <h1>{{ myPost.title }}</h1>
                        {% if myPost.cover|length > 0 %}
                          <img src="{{ static_url(myPost.cover) }}" class="space-top space-bottom-2x" alt="{{ myPost.title }}">
                        {% endif %}
                        <div class="row">
                            <div class="col-md-9">
                            {{ myPost.content }}
                            </div>
                            <!-- <div class="col-md-3 padding-top-3x space-top-3x hidden-sm hidden-xs">
                                <div class="downloadable">
                                    <img src="img/versions/universal1.png" alt="Windows Phone">
                                    <h5>Windows Phone</h5>
                                    <p>Coming never</p>
                                </div>
                            </div> -->
                        </div>
                    </div>
                    <div class="post-meta space-top-2x">
                        <div class="column">{{ date('F j, Y', myPost.datecreated) }}</div>
                        <div class="column">
                            <div class="social-buttons text-right">
                                <a href="#" class="sb-twitter"><i class="bi-twitter"></i></a>
                                <a href="#" class="sb-google-plus"><i class="bi-gplus"></i></a>
                                <a href="#" class="sb-facebook"><i class="bi-facebook"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="post-meta last-child space-bottom">
                        <div class="column">
                            <span>In </span><a href="{{ url('?orderby=datecreated&ordertype=desc&pcid=' ~ myPost.pcid) }}">{{ myPost.getCategoryName() }}</a>&nbsp;&nbsp;&nbsp;&nbsp;by <a href="#">{{ myPost.getAuthorName() }}</a>
                        </div>
                        <!-- <div class="column text-right">
                            <a href="#">#iOS</a> <a href="#">#Apple</a> <a href="#">#Other tags</a>
                        </div> -->
                    </div>
                    <div class="inner">
                        <!-- Comments -->
                        disquus
                    </div>
                </div>
                <!-- Comment Form -->
                </div>
                <!-- Sidebar -->
                <div class="col-lg-3 col-lg-pull-9 col-sm-4 col-sm-pull-8">
                    <div class="sidebar space-bottom-3x">
                        <!-- Categories -->
                        <div class="categories with-grid-btn">
                            <a href="blog.html" class="grid-btn">
                                <span></span>
                                <span></span>
                            </a>
                            <ul>
                              {% for cat in categoryList %}
                                <li><a href="{{ url('?orderby=datecreated&ordertype=desc&pcid=' ~ post.pcid) }}">{{ cat.name }}</a></li>
                              {% endfor %}
                            </ul>
                        </div>
                        <hr>

                        <!-- Featured Posts -->
                        <div class="box-float">
                          {% for fpost in featurePost.items if fpost.id != myPost.id %}
                            <a href="#" class="featured-post bg-{{ fpost.getLabel() }} waves-effect waves-light">
                                <div class="content">
                                    <div class="arrow"><i class="flaticon-right244"></i></div>
                                    <h3>{{ fpost.title }}</h3>
                                    <p>{{ fpost.summary }}</p>
                                </div>
                            </a>
                          {% endfor %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </section><!-- Single Post End -->
{% endblock %}

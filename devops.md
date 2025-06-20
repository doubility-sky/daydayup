[DevOps](https://en.wikipedia.org/wiki/DevOps) is a set of practices that combines software development (Dev) and information-technology operations (Ops) which aims to shorten the systems development life cycle and provide continuous delivery with high software quality.

- [Let's talk DevOps job titles](https://mattouille.com/articles/2018-06/lets-talk-devops-job-titles/)


- [[container]]
  - [[docker]]
  - [[kubernetes]]



## Learn
- [DevOps Roadmap](https://github.com/kamranahmedse/developer-roadmap#devops-roadmap)



## [Continuous Integration](https://en.wikipedia.org/wiki/Continuous_integration) (CI)
In software engineering, continuous integration (CI) is the practice of merging all developers' working copies to a shared mainline several times a day. Grady Booch first proposed the term CI in his 1991 method, although he did not advocate integrating several times a day. Extreme programming (XP) adopted the concept of CI and did advocate integrating more than once per day – perhaps as many as tens of times per day.
- [jenkinsci/jenkins](https://github.com/jenkinsci/jenkins), In a nutshell, Jenkins is the leading open-source automation server. Built with Java, it provides over 1600 plugins to support automating virtually anything, so that humans can actually spend their time doing things machines cannot.
- [Travis CI](https://github.com/travis-ci/travis-ci), Free continuous integration platform for GitHub projects. https://travis-ci.org
  - Travis CI is a hosted continuous integration and deployment system. You can now test and deploy open source and private projects on [travis-ci.com](https://travis-ci.com/)! You can read more about this change [here](https://blog.travis-ci.com/2018-05-02-open-source-projects-on-travis-ci-com-with-github-apps).
- [Gitlab CICD](https://docs.gitlab.com/ee/ci/), GitLab CI/CD is a tool for software development using the continuous methodologies:
  - [Continuous Integration (CI)](https://docs.gitlab.com/ee/ci/introduction/index.html#continuous-integration)
  - [Continuous Delivery (CD)](https://docs.gitlab.com/ee/ci/introduction/index.html#continuous-delivery)
  - [Continuous Deployment (CD)](https://docs.gitlab.com/ee/ci/introduction/index.html#continuous-deployment)
  - [.gitlab-ci.yml](https://docs.gitlab.com/ee/ci/yaml/gitlab_ci_yaml.html), 
    In the .gitlab-ci.yml file, you can define:
    The scripts you want to run.
    ```yml
    stages:
      - build
      - test

    build-code-job:
      stage: build
      script:
        - echo "Check the ruby version, then build some Ruby project files:"
        - ruby -v
        - rake

    test-code-job1:
      stage: test
      script:
        - echo "If the files are built successfully, test some files with one command:"
        - rake test1

    test-code-job2:
      stage: test
      script:
        - echo "If the files are built successfully, test other files with a different command:"
        - rake test2
    ```



## [Continuous Deployment](https://en.wikipedia.org/wiki/Continuous_deployment) (CD)
- [Ansible](./ansible), Ansible is a suite of software tools that enables infrastructure as code. It is open-source and the suite includes software provisioning, configuration management, and application deployment functionality.
- [Apache Airflow®](https://airflow.apache.org/) is a platform created by the community to programmatically author, schedule and monitor workflows.



## Tools
- [free-for.dev](https://github.com/ripienaar/free-for-dev) A list of SaaS, PaaS and IaaS offerings that have free tiers of interest to devops and infradev 
- [2019十大最佳DevOps工具](http://dockone.io/article/8507)
- [DevOps工具链](https://www.cnblogs.com/fadewalk/p/10808436.html)
- [20+最好的持续集成工具](https://cloud.tencent.com/developer/article/1438822)



## FAQs
- [持续集成是什么？](http://www.ruanyifeng.com/blog/2015/09/continuous-integration.html)

FROM registry.gocurb.internal:80/ansible

RUN mkdir /opt/curbformation-templates
COPY . /opt/curbformation-templates
WORKDIR /opt/curbformation-templates
RUN pip3 install -r requirements.txt
ONBUILD COPY . /opt/curbformation-templates
ENTRYPOINT ["cf"]

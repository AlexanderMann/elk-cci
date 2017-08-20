FROM sebp/elk:551

COPY logstash/02-beats-input.conf /etc/logstash/conf.d/30-output.conf
COPY logstash/30-output.conf      /etc/logstash/conf.d/02-beats-input.conf

CMD [ "/usr/local/bin/start.sh" ]


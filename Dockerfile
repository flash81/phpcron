FROM 2684498887/php:cron
MAINTAINER yefengli <2684498887@qq.com>

ADD run.sh /run.sh

CMD ["/run.sh"]
Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 08166380DAB
	for <lists+greybus-dev@lfdr.de>; Fri, 14 May 2021 17:56:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 90A5561035
	for <lists+greybus-dev@lfdr.de>; Fri, 14 May 2021 15:56:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4ADF061146; Fri, 14 May 2021 15:56:19 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8E0F961030;
	Fri, 14 May 2021 15:56:16 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7A2BE60A44
 for <greybus-dev@lists.linaro.org>; Fri, 14 May 2021 15:56:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 77E9A6102C; Fri, 14 May 2021 15:56:15 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0199.hostedemail.com
 [216.40.44.199])
 by lists.linaro.org (Postfix) with ESMTPS id 6D99360A44
 for <greybus-dev@lists.linaro.org>; Fri, 14 May 2021 15:56:13 +0000 (UTC)
Received: from omf12.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id EF2431802B4D5;
 Fri, 14 May 2021 15:56:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf12.hostedemail.com (Postfix) with ESMTPA id 9398824023B; 
 Fri, 14 May 2021 15:56:11 +0000 (UTC)
Message-ID: <bccbec1a0ffbf6c31b5e6a78cedd78cd64f2b8fe.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, Shreyansh Chouhan
 <chouhan.shreyansh630@gmail.com>
Date: Fri, 14 May 2021 08:56:10 -0700
In-Reply-To: <YJ6XpUMliWQOS8MB@kroah.com>
References: <20210514133039.304760-1-chouhan.shreyansh630@gmail.com>
 <YJ582f3O9K9YD3QA@kroah.com> <YJ5/tqFfcjxOLsF0@fedora>
 <YJ6DrLiMsdkG5loA@kroah.com> <YJ6H/WsojYcN/bLO@fedora>
 <YJ6Jf+Z1ReVgDt64@kroah.com> <YJ6TUAowTI75h/sl@fedora>
 <YJ6XpUMliWQOS8MB@kroah.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 9398824023B
X-Spam-Status: No, score=-1.40
X-Stat-Signature: bsd4jy9waaadwjctjaqreet6ob39ob4w
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19CiF0j1HLMKl+eajSpiUzTVTMqH8HjOIk=
X-HE-Tag: 1621007771-347867
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix
 gb_loopback_stats_attrs definition
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: elder@kernel.org, linux-staging@lists.linux.dev, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, 2021-05-14 at 17:30 +0200, Greg KH wrote:
> On Fri, May 14, 2021 at 08:42:16PM +0530, Shreyansh Chouhan wrote:
[]
> > I didn't look at how/where was the macro called and missed a very
> > obvious error. Now that I have looked at it, the only way I can think of
> > fixing this is changing the macro to a (inline?) function. Will
> > that be a desirable change?
> 
> No, it can't be a function, the code is fine as-is, checkpatch is just a
> perl script and does not always know what needs to be done.

true.

perhaps better though to rename these declaring macros to start with declare_

Something like this:
(with miscellaneous realigning of the macros line ending continuations \)
---
 drivers/staging/greybus/loopback.c | 72 +++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 2471448ba42a..dc399792f35f 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -119,18 +119,18 @@ module_param(kfifo_depth, uint, 0444);
 #define GB_LOOPBACK_US_WAIT_MAX				1000000
 
 /* interface sysfs attributes */
-#define gb_loopback_ro_attr(field)				\
-static ssize_t field##_show(struct device *dev,			\
+#define declare_gb_loopback_ro_attr(field)				\
+static ssize_t field##_show(struct device *dev,				\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%u\n", gb->field);			\
+	return sprintf(buf, "%u\n", gb->field);				\
 }									\
 static DEVICE_ATTR_RO(field)
 
-#define gb_loopback_ro_stats_attr(name, field, type)		\
-static ssize_t name##_##field##_show(struct device *dev,	\
+#define declare_gb_loopback_ro_stats_attr(name, field, type)		\
+static ssize_t name##_##field##_show(struct device *dev,		\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
 {									\
@@ -142,8 +142,8 @@ static ssize_t name##_##field##_show(struct device *dev,	\
 }									\
 static DEVICE_ATTR_RO(name##_##field)
 
-#define gb_loopback_ro_avg_attr(name)			\
-static ssize_t name##_avg_show(struct device *dev,		\
+#define declare_gb_loopback_ro_avg_attr(name)				\
+static ssize_t name##_avg_show(struct device *dev,			\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
 {									\
@@ -151,8 +151,8 @@ static ssize_t name##_avg_show(struct device *dev,		\
 	struct gb_loopback *gb;						\
 	u64 avg, rem;							\
 	u32 count;							\
-	gb = dev_get_drvdata(dev);			\
-	stats = &gb->name;					\
+	gb = dev_get_drvdata(dev);					\
+	stats = &gb->name;						\
 	count = stats->count ? stats->count : 1;			\
 	avg = stats->sum + count / 2000000; /* round closest */		\
 	rem = do_div(avg, count);					\
@@ -162,12 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
 }									\
 static DEVICE_ATTR_RO(name##_avg)
 
-#define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+#define declare_gb_loopback_stats_attrs(field)				\
+	declare_gb_loopback_ro_stats_attr(field, min, u);		\
+	declare_gb_loopback_ro_stats_attr(field, max, u);		\
+	declare_gb_loopback_ro_avg_attr(field)
 
-#define gb_loopback_attr(field, type)					\
+#define declare_gb_loopback_attr(field, type)				\
 static ssize_t field##_show(struct device *dev,				\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
@@ -193,8 +193,8 @@ static ssize_t field##_store(struct device *dev,			\
 }									\
 static DEVICE_ATTR_RW(field)
 
-#define gb_dev_loopback_ro_attr(field, conn)				\
-static ssize_t field##_show(struct device *dev,		\
+#define declare_gb_dev_loopback_ro_attr(field, conn)			\
+static ssize_t field##_show(struct device *dev,				\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
 {									\
@@ -203,7 +203,7 @@ static ssize_t field##_show(struct device *dev,		\
 }									\
 static DEVICE_ATTR_RO(field)
 
-#define gb_dev_loopback_rw_attr(field, type)				\
+#define declare_gb_dev_loopback_rw_attr(field, type)			\
 static ssize_t field##_show(struct device *dev,				\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
@@ -223,7 +223,7 @@ static ssize_t field##_store(struct device *dev,			\
 	if (ret != 1)							\
 		len = -EINVAL;						\
 	else								\
-		gb_loopback_check_attr(gb);		\
+		gb_loopback_check_attr(gb);				\
 	mutex_unlock(&gb->mutex);					\
 	return len;							\
 }									\
@@ -268,26 +268,26 @@ static void gb_loopback_check_attr(struct gb_loopback *gb)
 }
 
 /* Time to send and receive one message */
-gb_loopback_stats_attrs(latency);
+declare_gb_loopback_stats_attrs(latency);
 /* Number of requests sent per second on this cport */
-gb_loopback_stats_attrs(requests_per_second);
+declare_gb_loopback_stats_attrs(requests_per_second);
 /* Quantity of data sent and received on this cport */
-gb_loopback_stats_attrs(throughput);
+declare_gb_loopback_stats_attrs(throughput);
 /* Latency across the UniPro link from APBridge's perspective */
-gb_loopback_stats_attrs(apbridge_unipro_latency);
+declare_gb_loopback_stats_attrs(apbridge_unipro_latency);
 /* Firmware induced overhead in the GPBridge */
-gb_loopback_stats_attrs(gbphy_firmware_latency);
+declare_gb_loopback_stats_attrs(gbphy_firmware_latency);
 
 /* Number of errors encountered during loop */
-gb_loopback_ro_attr(error);
+declare_gb_loopback_ro_attr(error);
 /* Number of requests successfully completed async */
-gb_loopback_ro_attr(requests_completed);
+declare_gb_loopback_ro_attr(requests_completed);
 /* Number of requests timed out async */
-gb_loopback_ro_attr(requests_timedout);
+declare_gb_loopback_ro_attr(requests_timedout);
 /* Timeout minimum in useconds */
-gb_loopback_ro_attr(timeout_min);
+declare_gb_loopback_ro_attr(timeout_min);
 /* Timeout minimum in useconds */
-gb_loopback_ro_attr(timeout_max);
+declare_gb_loopback_ro_attr(timeout_max);
 
 /*
  * Type of loopback message to send based on protocol type definitions
@@ -297,21 +297,21 @@ gb_loopback_ro_attr(timeout_max);
  *					   payload returned in response)
  * 4 => Send a sink message (message with payload, no payload in response)
  */
-gb_dev_loopback_rw_attr(type, d);
+declare_gb_dev_loopback_rw_attr(type, d);
 /* Size of transfer message payload: 0-4096 bytes */
-gb_dev_loopback_rw_attr(size, u);
+declare_gb_dev_loopback_rw_attr(size, u);
 /* Time to wait between two messages: 0-1000 ms */
-gb_dev_loopback_rw_attr(us_wait, d);
+declare_gb_dev_loopback_rw_attr(us_wait, d);
 /* Maximum iterations for a given operation: 1-(2^32-1), 0 implies infinite */
-gb_dev_loopback_rw_attr(iteration_max, u);
+declare_gb_dev_loopback_rw_attr(iteration_max, u);
 /* The current index of the for (i = 0; i < iteration_max; i++) loop */
-gb_dev_loopback_ro_attr(iteration_count, false);
+declare_gb_dev_loopback_ro_attr(iteration_count, false);
 /* A flag to indicate synchronous or asynchronous operations */
-gb_dev_loopback_rw_attr(async, u);
+declare_gb_dev_loopback_rw_attr(async, u);
 /* Timeout of an individual asynchronous request */
-gb_dev_loopback_rw_attr(timeout, u);
+declare_gb_dev_loopback_rw_attr(timeout, u);
 /* Maximum number of in-flight operations before back-off */
-gb_dev_loopback_rw_attr(outstanding_operations_max, u);
+declare_gb_dev_loopback_rw_attr(outstanding_operations_max, u);
 
 static struct attribute *loopback_attrs[] = {
 	&dev_attr_latency_min.attr,

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev

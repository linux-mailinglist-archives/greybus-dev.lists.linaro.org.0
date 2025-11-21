Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EB474C78983
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Nov 2025 12:00:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B2C3A3F9B4
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Nov 2025 11:00:16 +0000 (UTC)
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	by lists.linaro.org (Postfix) with ESMTPS id BD9D63F8FF
	for <greybus-dev@lists.linaro.org>; Fri, 21 Nov 2025 06:45:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of vulab@iscas.ac.cn designates 159.226.251.81 as permitted sender) smtp.mailfrom=vulab@iscas.ac.cn;
	dmarc=none
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAAnudubCiBpQfGDAQ--.21029S2;
	Fri, 21 Nov 2025 14:45:47 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Ayush Singh <ayushdevel1325@gmail.com>
Date: Fri, 21 Nov 2025 14:40:27 +0800
Message-ID: <20251121064027.571-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAnudubCiBpQfGDAQ--.21029S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr18GFW5uryDKr47tF17GFg_yoW8urWfpF
	WDG345tF1kJ3Zaqrn5Xan8ua4Fyay8Jay7GFZ3X347AFWqqF1vyrWjyFyYvFWfGFZ3Jry3
	XFW0qrykZa1UZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU8E__UUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAYNA2kftcL9KQABsQ
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:159.226.251.0/25];
	ONCE_RECEIVED(0.20)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:7497, ipnet:159.226.0.0/16, country:CN];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	HAS_XOIP(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BD9D63F8FF
X-Spamd-Bar: -
X-MailFrom: vulab@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5NFI7VZG4YIFJV4M2KSLHSCVNKZHW4K6
X-Message-ID-Hash: 5NFI7VZG4YIFJV4M2KSLHSCVNKZHW4K6
X-Mailman-Approved-At: Fri, 21 Nov 2025 11:00:09 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Haotian Zhang <vulab@iscas.ac.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: gb-beagleplay: Fix timeout handling in bootloader functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5NFI7VZG4YIFJV4M2KSLHSCVNKZHW4K6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

wait_for_completion_timeout() returns the remaining jiffies
(at least 1) on success or 0 on timeout, but never negative
error codes. The current code incorrectly checks for negative
values, causing timeouts to be ignored and treated as success.

Check for a zero return value to correctly identify and
handle timeout events.

Fixes: 0cf7befa3ea2 ("greybus: gb-beagleplay: Add firmware upload API")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/greybus/gb-beagleplay.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index 9610f878da1b..87186f891a6a 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -644,8 +644,8 @@ static int cc1352_bootloader_wait_for_ack(struct gb_beagleplay *bg)
 
 	ret = wait_for_completion_timeout(
 		&bg->fwl_ack_com, msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
-	if (ret < 0)
-		return dev_err_probe(&bg->sd->dev, ret,
+	if (!ret)
+		return dev_err_probe(&bg->sd->dev, -ETIMEDOUT,
 				     "Failed to acquire ack semaphore");
 
 	switch (READ_ONCE(bg->fwl_ack)) {
@@ -683,8 +683,8 @@ static int cc1352_bootloader_get_status(struct gb_beagleplay *bg)
 	ret = wait_for_completion_timeout(
 		&bg->fwl_cmd_response_com,
 		msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
-	if (ret < 0)
-		return dev_err_probe(&bg->sd->dev, ret,
+	if (!ret)
+		return dev_err_probe(&bg->sd->dev, -ETIMEDOUT,
 				     "Failed to acquire last status semaphore");
 
 	switch (READ_ONCE(bg->fwl_cmd_response)) {
@@ -768,8 +768,8 @@ static int cc1352_bootloader_crc32(struct gb_beagleplay *bg, u32 *crc32)
 	ret = wait_for_completion_timeout(
 		&bg->fwl_cmd_response_com,
 		msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
-	if (ret < 0)
-		return dev_err_probe(&bg->sd->dev, ret,
+	if (!ret)
+		return dev_err_probe(&bg->sd->dev, -ETIMEDOUT,
 				     "Failed to acquire last status semaphore");
 
 	*crc32 = READ_ONCE(bg->fwl_cmd_response);
-- 
2.50.1.windows.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

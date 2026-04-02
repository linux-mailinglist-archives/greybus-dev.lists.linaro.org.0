Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ6NN5rc0GniBQcAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:42 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F4539A8E5
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 56F1240446
	for <lists+greybus-dev@lfdr.de>; Sat,  4 Apr 2026 09:40:41 +0000 (UTC)
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	by lists.linaro.org (Postfix) with ESMTPS id AB46F3F8FE
	for <greybus-dev@lists.linaro.org>; Thu,  2 Apr 2026 05:40:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	dmarc=none;
	spf=pass (lists.linaro.org: domain of pengpeng@iscas.ac.cn designates 159.226.251.21 as permitted sender) smtp.mailfrom=pengpeng@iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowADHbGhAAc5pT_bxCw--.8160S2;
	Thu, 02 Apr 2026 13:40:17 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Ayush Singh <ayushdevel1325@gmail.com>,
	Johan Hovold <johan@kernel.org>
Date: Thu,  2 Apr 2026 13:40:16 +0800
Message-ID: <20260402054016.38587-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADHbGhAAc5pT_bxCw--.8160S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KryDtw17Kry3tF4kAFW8WFg_yoW8GrWfpF
	9xKFy8trn5J3WfJan3X3W3uFyFyaykZFWakFW8Awn7ZFs8XFn2934DGFWYqa95Jr1xJry2
	qF4jgF92kF4DJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUvXd8UUU
	UU=
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Bar: -
X-MailFrom: pengpeng@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CB4ZPKILHPYZJLDPJS54FZIKWE57HDXJ
X-Message-ID-Hash: CB4ZPKILHPYZJLDPJS54FZIKWE57HDXJ
X-Mailman-Approved-At: Sat, 04 Apr 2026 09:40:25 +0000
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: gb-beagleplay: bound bootloader receive buffering
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CB4ZPKILHPYZJLDPJS54FZIKWE57HDXJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[52];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,greybus-dev-bounces@lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 84F4539A8E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

cc1352_bootloader_rx() appends each serdev chunk into the fixed
rx_buffer before parsing bootloader packets. The helper can keep
leftover bytes between callbacks and may receive multiple packets in one
callback, so a single count value is not constrained by one packet
length.

Check that the incoming chunk fits in the remaining receive buffer space
before memcpy(). If it does not, drop the staged data and consume the
bytes instead of overflowing rx_buffer.

Fixes: 0cf7befa3ea2 ("greybus: gb-beagleplay: Add firmware upload API")
Cc: stable@vger.kernel.org
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/greybus/gb-beagleplay.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index 87186f891a6a..e70787146c4f 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -535,6 +535,13 @@ static size_t cc1352_bootloader_rx(struct gb_beagleplay *bg, const u8 *data,
 	int ret;
 	size_t off = 0;
 
+	if (count > sizeof(bg->rx_buffer) - bg->rx_buffer_len) {
+		dev_warn(&bg->sd->dev,
+			 "dropping oversized bootloader receive chunk");
+		bg->rx_buffer_len = 0;
+		return count;
+	}
+
 	memcpy(bg->rx_buffer + bg->rx_buffer_len, data, count);
 	bg->rx_buffer_len += count;
 
-- 
2.50.1 (Apple Git-155)

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

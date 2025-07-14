Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C23B040C0
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Jul 2025 15:58:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 74FBC440CE
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Jul 2025 13:58:41 +0000 (UTC)
Received: from hosted.mailcow.de (hosted.mailcow.de [5.1.76.202])
	by lists.linaro.org (Postfix) with ESMTPS id 324B543C07
	for <greybus-dev@lists.linaro.org>; Mon, 14 Jul 2025 13:46:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=abhy.me header.s=dkim header.b=bfODwRDB;
	spf=pass (lists.linaro.org: domain of me@abhy.me designates 5.1.76.202 as permitted sender) smtp.mailfrom=me@abhy.me;
	dmarc=pass (policy=none) header.from=abhy.me
Received: from mail.abhy.me (mail.abhy.me [156.67.110.73])
	(Authenticated sender: relay-abhinav@mailcow.de)
	by hosted.mailcow.de (Postcow) with ESMTPSA id A968B5C0264;
	Mon, 14 Jul 2025 15:46:47 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05A7DC1609;
	Mon, 14 Jul 2025 19:16:37 +0530 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abhy.me; s=dkim;
	t=1752500805; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=/XW1mZMqwG9RLzu6IY65wC4dZ35utOaJ0H/k4M8fGOs=;
	b=bfODwRDBe3IiAcXIsEiNlTmjA9vYfcWJrO2wxd0sSjcq/SyD3ggjk0oLyk4TEw/LmPv61R
	6gNQcZYE4djG0UlaAt1TFwtpuORNWzzKf3tT2LPeVmLRHhj3urThSB1hXb+k3lL5lLqsnh
	6tzdpA57iRXOzoPME8zXpjVeQFcRwdaIeW9o02XarQJTbs98zFmS5jaWlZZ0kM2PZzT5+g
	SFj9L3h6Rvu0J/16neyLvLEo184VF1qRuMJM0ZIw9rF7b6+D6OGsZzHhH9kDth7RLPeKCi
	X+zSGnnbNaPQf3usvaWDkksU0I/mYHEu+JGlipKJ7XnSUptnr2P5nsiYAQtnpQ==
From: Abhinav Krishna C K <me@abhy.me>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	elder@kernel.org,
	johan@kernel.org
Date: Mon, 14 Jul 2025 15:45:32 +0200
Message-ID: <20250714134537.59218-1-me@abhy.me>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 324B543C07
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[abhy.me,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:5.1.76.202];
	R_DKIM_ALLOW(-0.20)[abhy.me:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	DNSWL_BLOCKED(0.00)[5.1.76.202:from];
	ASN(0.00)[asn:34549, ipnet:5.1.76.0/24, country:DE];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[abhy.me:+];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[5.1.76.202:from];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: me@abhy.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: PV6M2C3KIITCEKYR7GECHVX3EJJCS6V2
X-Message-ID-Hash: PV6M2C3KIITCEKYR7GECHVX3EJJCS6V2
X-Mailman-Approved-At: Mon, 14 Jul 2025 13:58:40 +0000
CC: ~lkcamp/patches@lists.sr.ht, koike@igalia.com, Abhinav Krishna C K <me@abhy.me>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: firmware: Move logical AND to previous line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PV6M2C3KIITCEKYR7GECHVX3EJJCS6V2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix checkpatch CHECK:
    "Logical continuations should be on the previous line"
 in firmware.c:123

Signed-off-by: Abhinav Krishna C K <me@abhy.me>

---

Hello, this is my first patch, I appreciate any feedback, Thanks!
---
 drivers/staging/greybus/Documentation/firmware/firmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa9cc..e8fb2f575cd5 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -119,8 +119,8 @@ static int update_backend_firmware(int fd)
 	if (backend_fw_info.status == GB_FW_U_BACKEND_VERSION_STATUS_RETRY)
 		goto retry_fw_version;
 
-	if ((backend_fw_info.status != GB_FW_U_BACKEND_VERSION_STATUS_SUCCESS)
-	    && (backend_fw_info.status != GB_FW_U_BACKEND_VERSION_STATUS_NOT_AVAILABLE)) {
+	if ((backend_fw_info.status != GB_FW_U_BACKEND_VERSION_STATUS_SUCCESS) &&
+	    (backend_fw_info.status != GB_FW_U_BACKEND_VERSION_STATUS_NOT_AVAILABLE)) {
 		printf("Failed to get backend firmware version: %s (%d)\n",
 			fwdev, backend_fw_info.status);
 		return -1;
-- 
2.47.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

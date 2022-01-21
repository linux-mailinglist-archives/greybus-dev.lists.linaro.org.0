Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC054967B9
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Jan 2022 23:16:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3A19C401C2
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Jan 2022 22:16:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 2D22E3ED70
	for <greybus-dev@lists.linaro.org>; Fri, 21 Jan 2022 22:16:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A89AC6179B;
	Fri, 21 Jan 2022 22:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69CA1C340E1;
	Fri, 21 Jan 2022 22:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642803373;
	bh=OYCTY6mYYqGyq46xX5k/Wa4Dv6rOx+5pvjKpAGsRp24=;
	h=Date:From:To:Cc:Subject:From;
	b=FRnPNsvltvoh2BGl5bCUGgetbbZ730rbs2ZcCbMpYkPPZ6yFU80O51YaATBcV1ri7
	 sqxzLVvTD+ioqbBRm3NfkDR+mujYVp9wPbEf4DyvbN+oO6CJ0QfxZqXcXtfQumnzU5
	 bSAAe03qRCOxYcWg/B45y7a7qlk4xW/38IPOQN+Sd9mVUlZ8URIPJz3B9m+gzf+tWW
	 7YtXRrXsEkLxeyZZWfpSqY3iBw3bnC2MguqijDK3ZumDLvcHsGlk8KamXIJY66jxrp
	 1Z/2An8DdBuWIPYfYZIuptc5q285hK7qzxTKeETKu93ALHaT7/KpiBusFqrsOWxQJG
	 ilV6lXAWtgxiA==
Date: Fri, 21 Jan 2022 16:22:50 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20220121222250.GA73021@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
Message-ID-Hash: DYBSX7YEO6VH4CEYLWOM6XEVMU6TJNDG
X-Message-ID-Hash: DYBSX7YEO6VH4CEYLWOM6XEVMU6TJNDG
X-MailFrom: gustavoars@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH][next] staging: greybus: i2c: Use struct_size() helper in gb_i2c_operation_create()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DYBSX7YEO6VH4CEYLWOM6XEVMU6TJNDG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make use of the struct_size() helper instead of an open-coded version,
in order to avoid any potential type mistakes or integer overflows that,
in the worst scenario, could lead to heap overflows.

Also, address the following sparse warnings:
drivers/staging/greybus/i2c.c:111:24: warning: using sizeof on a flexible structure

Link: https://github.com/KSPP/linux/issues/174
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/staging/greybus/i2c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
index de2f6516da09..9dfc6791c20e 100644
--- a/drivers/staging/greybus/i2c.c
+++ b/drivers/staging/greybus/i2c.c
@@ -108,9 +108,7 @@ gb_i2c_operation_create(struct gb_connection *connection,
 		else
 			data_out_size += (u32)msg->len;
 
-	request_size = sizeof(*request);
-	request_size += msg_count * sizeof(*op);
-	request_size += data_out_size;
+	request_size = struct_size(request, ops, msg_count) + data_out_size;
 
 	/* Response consists only of incoming data */
 	operation = gb_operation_create(connection, GB_I2C_TYPE_TRANSFER,
-- 
2.27.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

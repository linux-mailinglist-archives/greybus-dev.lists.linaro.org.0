Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 294994A7009
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Feb 2022 12:36:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5DB373EE66
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Feb 2022 11:36:14 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id B1C523EE5B
	for <greybus-dev@lists.linaro.org>; Wed,  2 Feb 2022 11:36:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DD060B83087;
	Wed,  2 Feb 2022 11:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A958CC340E4;
	Wed,  2 Feb 2022 11:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643801767;
	bh=VuV5fpBatcVQSnnj4klzi06+IGvxAlBN/tidRdh2Omo=;
	h=From:To:Cc:Subject:Date:From;
	b=ivi2c6YeVPnjyA3frWcRmlgkNcOR/h9DPPZJB0X5UpLiUwIzDdOJyq7g+8BytP7rC
	 5O2dVCwSxdUHZt14OQBHOBQ/tK4W6KkBCc6Lh3iK3GEnIsN6hY9o8N+wDUp15VoeIP
	 X/e0HckJ1TL5HZ/pAoeyoEoRLuXMcK/e9wpZcC74rvl6apMwBooc3/UsQ8aC2wuuOL
	 ur0u/POaFQhk6KLqV5P/+Wu/kILE8iUJtDtvM8+7b6PJxQtVhWd5EeY8flim/9tPxZ
	 4nkMoF3JQdhFsVZDlwCRv10UlkD5YzZlGntxgyQ4oC68Zn6dxMKinhjhxSCroYY/RK
	 9OpC8mIkPFEtg==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nFDvT-0000Lv-4R; Wed, 02 Feb 2022 12:35:51 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  2 Feb 2022 12:33:44 +0100
Message-Id: <20220202113347.1288-1-johan@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Message-ID-Hash: UWE6WKTVNJFHY757VZIUK4TGKHNJYRFL
X-Message-ID-Hash: UWE6WKTVNJFHY757VZIUK4TGKHNJYRFL
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/3] greybus: svc: fix hello processing
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UWE6WKTVNJFHY757VZIUK4TGKHNJYRFL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dan found and fixed a bug in the SVC HELLO request error handling which
was introduced when adding a temporary hack to reconfigure the link at
HELLO.

The implementation of the hack abuses the deferred-request processing
mechanism to send the link-configuration request, which makes the
HELLO processing a bit hard to follow.

The last two patches attempt to remedy this.

This could go into either 5.17-rc or -next.

Johan


Dan Carpenter (1):
  greybus: svc: fix an error handling bug in gb_svc_hello()

Johan Hovold (2):
  greybus: svc: clean up hello error path
  greybus: svc: clean up link configuration hack at hello

 drivers/greybus/svc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565FCCF81A
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Dec 2025 12:00:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8808140137
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Dec 2025 11:00:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 6F9AF4013F
	for <greybus-dev@lists.linaro.org>; Fri, 19 Dec 2025 11:00:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=hptSDVd9;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABF2260018;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DA8C116D0;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766142005;
	bh=cF17zGVFV4ZnlfnDlhdLorJqqOiVe0AkoBNOXzOIVq0=;
	h=From:To:Cc:Subject:Date:From;
	b=hptSDVd9rJ+sQfCpAjzdrIQywtj8+SakhoZJRr4mEtn7SuZrqctokQ34Lmyi8p3Es
	 s1XAaICPjM1ESQJxoSyXnI8xeJgd56p7ziuR5XgV7eu78HaXRz1LSt9OgHXqLUacaR
	 KKnRmwuUgULgFXCbx/PJoxFQa3cjk0NZfS41H85bw9E9UdhWVQM8DGLfP4HJb6jA9z
	 eIzUCmK/UdJQ++HzKAeiSmpN5Dyj8+01vh1AiSpt3CytMSVhXYbhbpo0+RedvlGQ7D
	 zdeImO07HH6gNKgQUeApejHPyblZ2Sbyb8zNVRSGx6pvlPnU1aI55J/I/q6eE0snfA
	 qkNL2cpA52Smg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWYDL-0000000065b-15qd;
	Fri, 19 Dec 2025 12:00:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Date: Fri, 19 Dec 2025 11:59:25 +0100
Message-ID: <20251219105928.23329-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[tor.source.kernel.org:rdns,tor.source.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6F9AF4013F
X-Spamd-Bar: --
Message-ID-Hash: 246PPGEKD5JVWDPPZZBPSBCTWJ7C67HS
X-Message-ID-Hash: 246PPGEKD5JVWDPPZZBPSBCTWJ7C67HS
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/3] staging: greybus: arche-platform: fix probe issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/246PPGEKD5JVWDPPZZBPSBCTWJ7C67HS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series fixes some issues with the arche platform drivers probe
function.

A fix for the first issue was sent to the list two months ago, but there
has been no reply to the review feedback given then.

Non of these are tagged for stable backport as very few people should
have the hardware in question and be bothered by this.

Johan


Johan Hovold (3):
  staging: greybus: arche-platform: fix coldboot probe error path
  staging: greybus: arche-platform: fix memleak on probe failure
  staging: greybus: arche-platform: fix OF populate on driver rebind

 drivers/staging/greybus/arche-platform.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

-- 
2.51.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

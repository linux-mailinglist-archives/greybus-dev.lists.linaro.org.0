Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F742A893F9
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Apr 2025 08:36:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 70CE14453A
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Apr 2025 06:36:23 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 7B4E644289
	for <greybus-dev@lists.linaro.org>; Tue, 15 Apr 2025 06:36:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=k00gBR3r;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9B04EA430E1;
	Tue, 15 Apr 2025 06:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8D5C4CEDD;
	Tue, 15 Apr 2025 06:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744698976;
	bh=SywP8t9wqOOU/8ix1gqduSsYqPmyq/rtNdkMj6TjcXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k00gBR3rr2VN5htvNnFsTKuaPzBEF3nmYk9+S8n8OaMZLoVgO7xH2lvyB2cJE2Pgt
	 YkXCx92F1xTG71gOEbqOy54C4f1fKAOGVSM3D6VOxjjGJMM5W/U5uYlI/5Sar03ePq
	 yDlKOFabvRYQk6MkxFzAW8R2YKbWlo+iI/dWGC0W571Ugmq4KSLQKxZZhT/NdyVY1A
	 ISeCamnd8mY3dT1dZmwP8mxUAPjcil4UVFqgYCZfQbmaiusm58XTiweGxw8zPbuFaR
	 cixDdH7qEcTv1MbGsDRKNXwr8Ebjw6Ng2IrUCwsYDXH65G8cJGPFs5iBkwIlalewKn
	 S1eIrr6S9uq2A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4Zu1-0000000040P-1Y3Q;
	Tue, 15 Apr 2025 08:36:13 +0200
Date: Tue, 15 Apr 2025 08:36:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Message-ID: <Z_3-XS2DHEbqkSdx@hovoldconsulting.com>
References: <20250413104802.49360-2-thorsten.blum@linux.dev>
 <Z_yztGweLAfJgwXh@hovoldconsulting.com>
 <BF2CF4C6-5381-4266-9E49-9C81E9604007@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BF2CF4C6-5381-4266-9E49-9C81E9604007@linux.dev>
X-Rspamd-Queue-Id: 7B4E644289
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-9.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	RBL_SENDERSCORE_REPUT_9(-1.00)[147.75.193.91:from];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 2ERDG43UEAA7VYYE7K2ZJWGNG5YRIBOR
X-Message-ID-Hash: 2ERDG43UEAA7VYYE7K2ZJWGNG5YRIBOR
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Reformat code in gb_operation_sync_timeout()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2ERDG43UEAA7VYYE7K2ZJWGNG5YRIBOR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 14, 2025 at 05:00:41PM +0200, Thorsten Blum wrote:
> On 14. Apr 2025, at 09:05, Johan Hovold wrote:
> > This just makes the code *less* readable.
> 
> I guess you prefer the code with curly braces?

Around multiline statements yes, but the proposed if-else here also
obscures the logic for no good reason.

> What about the Linux kernel coding style [1]? Specifically "Do not
> unnecessarily use braces where a single statement will do."
> 
> My patch just removes any unnecessary curly braces, resulting in less
> lines of code and no line break in the memcpy() arguments.

I really don't care, the code is more readable as it stands which is
what matters.

If you want to practise sending patches you can send all the "cleanups"
you want for code in drivers/staging where churn like this may be
accepted (and where the core greybus code no longer lives, contrary to
what your Subject suggests).

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

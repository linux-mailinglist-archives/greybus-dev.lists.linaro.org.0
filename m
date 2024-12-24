Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D34069FB988
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Dec 2024 06:44:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 98EBE43BF6
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Dec 2024 05:44:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 327734114B
	for <greybus-dev@lists.linaro.org>; Tue, 24 Dec 2024 05:44:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=zUZzpTVp;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C21285C5B09;
	Tue, 24 Dec 2024 05:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A978C4CED0;
	Tue, 24 Dec 2024 05:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735019041;
	bh=z/WP4iY6tYW4JkD6RD4YF9ZGIXBgSIc/Ou+WwvJeX0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zUZzpTVp62scP1vWYUQ2MRiwKUGzkm6ekvAud+UGrKy/uUIZ75sXojmEoum4J0HwG
	 GJLncVBJatlKrpCecyQrrGxKLYJ51L1xL5e7+IYDRjmewKEapnlORN221CtbaK74bn
	 fb58a7zoNfu5LJ5SrzsEH/V1WdW0cPyoY2U4gNLY=
Date: Tue, 24 Dec 2024 06:43:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Message-ID: <2024122433-awry-active-bf6e@gregkh>
References: <2024122358-vexingly-broadly-7df7@gregkh>
 <20241224051917.1971-1-evepolonium@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241224051917.1971-1-evepolonium@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spam-Level: *
X-Rspamd-Queue-Id: 327734114B
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.04 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-2.96)[99.84%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[139.178.84.217:from];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,vger.kernel.org,lists.linux.dev,animalcreek.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: DIOVB5OJOOBXRUR2D2JC4M7LF64FWOYH
X-Message-ID-Hash: DIOVB5OJOOBXRUR2D2JC4M7LF64FWOYH
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, johan@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Remove Module from list before freeing in gb_audio_module_release
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DIOVB5OJOOBXRUR2D2JC4M7LF64FWOYH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 24, 2024 at 10:49:17AM +0530, Atharva Tiwari wrote:
> Yes I have tested the patch with greybus drivers enabled on Debian 12.It works as expected, and i did not get any errors or warning during the compilation

I have no context here, sorry.

Remember, some of use get over 1000 emails a day to do something with,
always respond with proper email quoting and context of what is going
on.

Also, just bulding code does not mean it works :)

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

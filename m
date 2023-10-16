Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 192517CB277
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Oct 2023 20:26:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D67493EFD4
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Oct 2023 18:26:29 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 1C7F53EFD4
	for <greybus-dev@lists.linaro.org>; Mon, 16 Oct 2023 18:26:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Ufl78Ecq;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0A5B4B81851;
	Mon, 16 Oct 2023 18:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4A4C433C8;
	Mon, 16 Oct 2023 18:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697480780;
	bh=4QtD0+rLtxMS6U30O6ec7Ox44kseY4kSGF0z7NZ53XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ufl78Ecqmotfjh5acHuhamZFw9ydHrqbHUmCQT+Z2jsGFLPTD0K7kUUVJm6LIuL7B
	 K61baQNTSCk3h+pxmocjQT21QHEiJp13ByRijMcnrX40jbtEjfF8COrDSWjIdZQJfj
	 fdJcyoPUU37C818FG3xVlgjIqDBME8mOk2t+dVjw=
Date: Mon, 16 Oct 2023 20:26:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023101618-concept-rarity-3e0f@gregkh>
References: <20231006041035.652841-1-ayushdevel1325@gmail.com>
 <20231006041035.652841-3-ayushdevel1325@gmail.com>
 <9affdae9-9e95-1f6c-5f18-845d5ffcbd71@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9affdae9-9e95-1f6c-5f18-845d5ffcbd71@gmail.com>
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.01 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-2.99)[99.97%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spam-Level: **
X-Rspamd-Queue-Id: 1C7F53EFD4
Message-ID-Hash: 6VMDX3VXUYUAITYNB2QIFOKLDZRXQU5R
X-Message-ID-Hash: 6VMDX3VXUYUAITYNB2QIFOKLDZRXQU5R
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v8 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6VMDX3VXUYUAITYNB2QIFOKLDZRXQU5R/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 13, 2023 at 05:11:23PM +0530, Ayush Singh wrote:
> Hello everyone, I would like to get some feedback on the driver patch before
> submitting the new version of this patch series.

I don't want to review a version that I know you are going to resubmit,
as that would waste my time when I should be reviewing patches from
others that they think are complete.

So just update and resend the new series please, no need to ask.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

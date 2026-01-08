Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C3DD02580
	for <lists+greybus-dev@lfdr.de>; Thu, 08 Jan 2026 12:19:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 71ABE40168
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jan 2026 11:19:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 1519E3F80E
	for <greybus-dev@lists.linaro.org>; Thu,  8 Jan 2026 11:19:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=BWQJ8pp2;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84A9E409C9;
	Thu,  8 Jan 2026 11:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5077C116C6;
	Thu,  8 Jan 2026 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767871140;
	bh=FGZwQSyMZHD7CiCo1EdHjpE0b5HIwayn41VqK5ITwy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWQJ8pp2/0jHRsG6oUsiTGMB7SJQKIX4H+XK5gmolG+GfqtWhInDKIkGRfpATXENc
	 5nxtW96cw1cio38BW6v+RRe9jy8/BoXQJjML8nC0ZUh96jVONnrNf3BohhAK92o5cW
	 GQLKG8Y6mvr6yH1VsopY+pOZQWOGpqa4pRHCMrMQ=
Date: Thu, 8 Jan 2026 12:18:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
Message-ID: <2026010848-untouched-stranger-dd3c@gregkh>
References: <20260108110743.28579-1-chaitanyamishra.ai@gmail.com>
 <20260108110926.29018-1-chaitanyamishra.ai@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108110926.29018-1-chaitanyamishra.ai@gmail.com>
X-Rspamd-Queue-Id: 1519E3F80E
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received];
	DWL_DNSWL_NONE(0.00)[linuxfoundation.org:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: KERSQMMKTJ5QCXC35PGKJDU6KSVDIQDU
X-Message-ID-Hash: KERSQMMKTJ5QCXC35PGKJDU6KSVDIQDU
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: rui.silva@linaro.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: lights: avoid NULL deref
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KERSQMMKTJ5QCXC35PGKJDU6KSVDIQDU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 08, 2026 at 04:39:26PM +0530, Chaitanya Mishra wrote:
> Hi Rui,
> 
> Thanks for the review.
> 
> I sent v3 with the version history below the --- line (no code changes).
> I couldn't add a lore link yet since the first version doesn't appear to
> be indexed;

I see it there:
	https://lore.kernel.org/all/20260108103700.15384-1-chaitanyamishra.ai@gmail.com/

> if it shows up and a respin is needed, I can add a Link: tag
> and carry your Reviewed-by.

You should have added it from v2.

Also, slow down, there's no rush here.  Usually you should wait at least
a day between new versions, right?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

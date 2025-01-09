Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B9292A06F5D
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jan 2025 08:51:33 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C483944B4D
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jan 2025 07:51:32 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 261BB3F44C
	for <greybus-dev@lists.linaro.org>; Thu,  9 Jan 2025 07:51:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=d1WERcU9;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A098A413E0;
	Thu,  9 Jan 2025 07:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC6AC4CEE6;
	Thu,  9 Jan 2025 07:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736409084;
	bh=UlShvnJ7Q8ZrM0G1xT/2I0HRmWo28fwE3T9IQ2VJHV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1WERcU9v272umJZcNJOmKab2QMk+PAEox8kGbUE/uDyWmVFh0zZ+ee/x5fBkwiLL
	 Xnn7wnbAv5QzYczp0esETjzv11/soLzvpTD2S/oddSwb6NDEVdnstCE/2MU46ThH9E
	 wuaqsUs8tOVcmWsZaZTro1/Q3aQCzpTIB/mXf4YM=
Date: Thu, 9 Jan 2025 08:50:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <2025010932-rice-landed-2b96@gregkh>
References: <20250109003624.37323-1-iron.will.walsh@gmail.com>
 <ed70a5d5-8e85-495b-9e56-eae472ba3046@ieee.org>
 <dcf6ec9f-39f2-4729-9250-14eb4d8d2adb@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dcf6ec9f-39f2-4729-9250-14eb4d8d2adb@stanley.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 261BB3F44C
X-Spamd-Bar: --
X-Spamd-Result: default: False [-3.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[147.75.193.91:from];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[ieee.org,gmail.com,animalcreek.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: T3UH7PJSRCDWLY47TTOL527JD2LRS5AH
X-Message-ID-Hash: T3UH7PJSRCDWLY47TTOL527JD2LRS5AH
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@ieee.org>, Will Walsh <iron.will.walsh@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove unnecessary parentheses
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/T3UH7PJSRCDWLY47TTOL527JD2LRS5AH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 09, 2025 at 10:45:50AM +0300, Dan Carpenter wrote:
> On Wed, Jan 08, 2025 at 08:56:50PM -0600, Alex Elder wrote:
> > On 1/8/25 6:36 PM, Will Walsh wrote:
> > > Unnecessary parentheses in boolean comparisons make it harder to read.
> > > 
> > > Removed the extra parentheses on line 305 for code readability.
> > > 
> > > Signed-off-by: Will Walsh <iron.will.walsh@gmail.com>
> > 
> > I'm not sure this makes a big difference in readability but I
> > personally avoid extra parentheses unless adding them makes a
> > compiler warning go away.
> 
> It's not a compiler warning, it checkpatch.

And it is a checkpatch warning that I HATE and keep rejecting, here's
where I did so yesterday:
	https://lore.kernel.org/r/2025010738-gong-rewind-2583@gregkh

Will, sorry, but I don't want to take this.

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

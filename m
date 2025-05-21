Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFC1ABEF6C
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 11:19:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B6B2940D24
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 09:19:41 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 1871240C9D
	for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 09:19:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b="CnwI/D7Q";
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4421A4E569;
	Wed, 21 May 2025 09:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F2EC4CEE4;
	Wed, 21 May 2025 09:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747819177;
	bh=KQZ0URLKaAeR3tem+EHBReFm/G2mKEAF1N/X4iJwrB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CnwI/D7QchRUObcWrSVYhqS/6KJS9ACo+MIkYyOrkgLUhEnnMdksgs2zCN7G7eHav
	 VHTDzZyMK+kZr0tp4EaFqhWpAGB9EojTwKD+ZnnQ26y+0fIMAyS/1H/24jQp9Q9zkZ
	 RLMiJcGSmrBlze+KZaqjdBkWRwAxy/RjSTV1FLps=
Date: Wed, 21 May 2025 11:19:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rujra Bhatt <braker.noob.kernel@gmail.com>
Message-ID: <2025052140-reprogram-polish-30da@gregkh>
References: <aC2ILNV6xgt11KuN@brak3r-Ubuntu>
 <2025052142-maturing-earthworm-cb31@gregkh>
 <CAG+54DZWjN3ii-JCOME8XdA1B+5yCmRSo0-wqTv+zt5w6UcEVA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG+54DZWjN3ii-JCOME8XdA1B+5yCmRSo0-wqTv+zt5w6UcEVA@mail.gmail.com>
X-Spam-Level: **
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.98%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[daringfireball.net:url,wikipedia.org:url,nyc.source.kernel.org:rdns,nyc.source.kernel.org:helo,linuxfoundation.org:dkim];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received,147.75.193.91:from];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 1871240C9D
X-Spamd-Bar: ++
Message-ID-Hash: OT7SRD65CZQF2CIOOKY3HJZVEA6T73ML
X-Message-ID-Hash: OT7SRD65CZQF2CIOOKY3HJZVEA6T73ML
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH RESEND] staging : greybus : Documentation : firmware : Replace deprecated strncpy() with strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OT7SRD65CZQF2CIOOKY3HJZVEA6T73ML/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 21, 2025 at 02:08:52PM +0530, Rujra Bhatt wrote:
> On Wed, May 21, 2025 at 09:06:00AM +0200, Greg KH wrote:
> > A: http://en.wikipedia.org/wiki/Top_post
> > Q: Were do I find info about this thing called top-posting?
> > A: Because it messes up the order in which people normally read text.
> > Q: Why is top-posting such a bad thing?
> > A: Top-posting.
> > Q: What is the most annoying thing in e-mail?
> >
> > A: No.
> > Q: Should I include quotations after my reply?
> >
> >
> > http://daringfireball.net/2007/07/on_top
> >
> > On Wed, May 21, 2025 at 11:11:26AM +0530, rujra wrote:
> > > Hi greg,
> > >
> > > why is this a RESEND ?:
> > >
> > > >> I had sent the same patch 4 days ago and didn't get any reply , hence tried to resend the same patch for the same,
> > > here is earlier mail :
> > > https://mail.google.com/mail/u/1/?ik=f63b03515e&view=om&permmsgid=msg-a:s:12290863930259651721
> >
> > That is a link to _your_ account, not a public record of your email :(
> >
> > > ,
> > >
> > > line does not match this:
> > > >> sorry , i could not get it what it is exactly ?, if possible can you share some insights or example so that from in future i would get it right.
> >
> > Your "From:" line in your email does not match with the signed-off-by
> > line.
> 
> This has been addressed successfully, Kindly preview it.

I'm sorry, preview what exactly?  If you think you have fixed it,
send a new patch with it fixed up as a new version.  I can't determine
anything just from an email like this :)

> is this the way correct about the reply email ?

Yes.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

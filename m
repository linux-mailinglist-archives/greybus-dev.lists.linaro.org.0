Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FE57D1D8F
	for <lists+greybus-dev@lfdr.de>; Sat, 21 Oct 2023 16:46:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E72AC3F02E
	for <lists+greybus-dev@lfdr.de>; Sat, 21 Oct 2023 14:45:59 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 3BA103F006
	for <greybus-dev@lists.linaro.org>; Sat, 21 Oct 2023 14:45:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b="xd/Y37OO";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B1492CE10BD;
	Sat, 21 Oct 2023 14:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFCCC433C8;
	Sat, 21 Oct 2023 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697899550;
	bh=CMHx6vpJK1A9SfM1ishkO5D8JuHrp8FLmjMYTmtAGJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xd/Y37OOKMmkC3ADllgJhPbvwtQV1DosWbWSAnZPL+0bXGX7KyzWi0T5nvz83nBsb
	 XkaeNt8MWUKkNE35m207msxkKHaD9xEEz3tLvfXYnncqMn16FnvQYsp3utf5+n62t8
	 tbSWzbjoVIJtYr56FrhHdBUioroBHUC0azCzDqNk=
Date: Sat, 21 Oct 2023 16:45:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
Message-ID: <2023102147-educator-worry-06f4@gregkh>
References: <20231021133527.GB12776@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231021133527.GB12776@ubuntu>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3BA103F006
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:email];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Spam-Level: **
Message-ID-Hash: M77KKILGQE56NGXCVIR5WFHMTPU7GEIW
X-Message-ID-Hash: M77KKILGQE56NGXCVIR5WFHMTPU7GEIW
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/M77KKILGQE56NGXCVIR5WFHMTPU7GEIW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 21, 2023 at 06:35:27AM -0700, Nandha Kumar Singaram wrote:
> greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
> linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
> Bcc: 
> Subject: Re: [PATCH] staging: greybus: Alignment should match open parenthesis
> Reply-To: 
> In-Reply-To: <2023102131-slacker-lily-28ff@gregkh>
> 
> On Sat, Oct 21, 2023 at 11:48:32AM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Oct 19, 2023 at 02:39:49PM -0700, Nandha Kumar Singaram wrote:
> > > Adhere to linux coding style. Reported by checkpatch.pl:
> > > CHECK: Alignment should match open parenthesis
> > > 
> > > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > > ---
> > >  drivers/staging/greybus/camera.c | 14 +++++++-------
> > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > > index cdbb42cd413b..405c8e78aa72 100644
> > > --- a/drivers/staging/greybus/camera.c
> > > +++ b/drivers/staging/greybus/camera.c
> > > @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> > >  }
> > >  
> > >  static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > > -		struct gb_camera_configure_streams_response *resp)
> > > +				      struct gb_camera_configure_streams_response *resp)
> > >  {
> > >  	unsigned int max_pkt_size = 0;
> > >  	unsigned int i;
> > > @@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > >   * Validate the stream configuration response verifying padding is correctly
> > >   * set and the returned number of streams is supported
> > >   */
> > > -static const int gb_camera_configure_streams_validate_response(
> > > -		struct gb_camera *gcam,
> > > +static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
> > 
> > Why change this line?
> >
> did these Code change to fix CHECK: Lines should not end with a '(' reported by
> checkpatch.pl

That's great, but you didn't say that in your changelog text, so it
looks wrong here :(

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

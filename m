Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C8939ACB5
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 23:22:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5702260E9C
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 21:22:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4F8F960A03; Thu,  3 Jun 2021 21:22:54 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 338956066C;
	Thu,  3 Jun 2021 21:22:52 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C82C160561
 for <greybus-dev@lists.linaro.org>; Thu,  3 Jun 2021 21:22:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BBADA605C8; Thu,  3 Jun 2021 21:22:50 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by lists.linaro.org (Postfix) with ESMTPS id 7EA2860561
 for <greybus-dev@lists.linaro.org>; Thu,  3 Jun 2021 21:22:48 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-286-Jvo2qcnVMfKEowSTBxAhDg-1; Thu, 03 Jun 2021 22:22:45 +0100
X-MC-Unique: Jvo2qcnVMfKEowSTBxAhDg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 22:22:44 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Thu, 3 Jun 2021 22:22:44 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Manikishan Ghantasala' <manikishanghantasala@gmail.com>, Alex Elder
 <elder@ieee.org>
Thread-Topic: [PATCH] staging: greybus: fixed the coding style, labels should
 not be indented.
Thread-Index: AQHXV7uPElUZ9thDckyuMtjnIAGFwKsCzNHA
Date: Thu, 3 Jun 2021 21:22:44 +0000
Message-ID: <792dd57c0ef8454497e5ae4c4534dea2@AcuMS.aculab.com>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
In-Reply-To: <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fixed the coding style,
 labels should not be indented.
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: Alex Elder <elder@kernel.org>,
 "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

From: Manikishan Ghantasala
> Sent: 02 June 2021 15:28
> 
> I agree those are called bit-field member names rather than labels.
> But the reason I mentioned is because the ./scripts/checkpatch.pl
> gave out a warning saying "labels should not be indented".
> 
> Sorry for the confusion in the name I referred to. So, I think this
> change is needed as I feel this is not following the coding-style by
> having indent before the width for bit field member. I went through
> other places in source code to make sure this is correct, and sent the
> patch after confirmation.
> 
> Regards,
> Manikishan Ghantasala
> 
> On Wed, 2 Jun 2021 at 19:13, Alex Elder <elder@ieee.org> wrote:
> >
> > On 6/2/21 8:36 AM, sh4nnu wrote:
> > > From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
> > >
> > > staging: greybus: gpio.c: Clear coding-style problem
> > > "labels should not be indented" by removing indentation.
> >
> > These are not labels.
> >
> > I don't really understand what you're doing here.
> >
> > Can you please explain why you think this needs changing?
> >
> >                                         -Alex
> >
> > > Signed-off-by: Manikishan Ghantasala <manikishanghantasala@gmail.com>
> > > ---
> > >   drivers/staging/greybus/gpio.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> > > index 7e6347fe93f9..4661f4a251bd 100644
> > > --- a/drivers/staging/greybus/gpio.c
> > > +++ b/drivers/staging/greybus/gpio.c
> > > @@ -20,9 +20,9 @@
> > >   struct gb_gpio_line {
> > >       /* The following has to be an array of line_max entries */
> > >       /* --> make them just a flags field */
> > > -     u8                      active:    1,
> > > -                             direction: 1,   /* 0 = output, 1 = input */
> > > -                             value:     1;   /* 0 = low, 1 = high */
> > > +     u8                      active:1,
> > > +                             direction:1,    /* 0 = output, 1 = input */
> > > +                             value:1;        /* 0 = low, 1 = high */

Why are you even using bitfields at all?
If you cared about the structure size you'd not have a byte-size pad here.

Since I doubt many copies of this structure get allocated the
(typical) increase in code size for the bitfields will also
exceed any size saving.

Isn't the kernel style also to repeat the type for every field?

	David


> > >       u16                     debounce_usec;
> > >
> > >       u8                      irq_type;
> > >
> >

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev

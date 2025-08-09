from reportlab.lib.pagesizes import landscape, A7
from reportlab.lib.units import mm
from reportlab.pdfgen import canvas
import os
OUT='sample-member-ids'
os.makedirs(OUT,exist_ok=True)
members=['GAPARK-0001_Maria_Cruz','GAPARK-0002_Jose_Ramirez']
for m in members:
    mid, name = m.split('_',1)
    path=os.path.join(OUT,f"{mid}.pdf")
    c=canvas.Canvas(path,pagesize=landscape(A7))
    w,h = landscape(A7)
    c.setFont('Helvetica-Bold',10); c.drawString(6*mm,h-6*mm,'GAPARK')
    c.drawString(6*mm,h-18*mm,name.replace('_',' '))
    c.drawString(6*mm,h-24*mm,f'ID: {mid}')
    c.showPage(); c.save()
    print('created',path)
